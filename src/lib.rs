use std::fs;

use zed_extension_api::{self as zed, LanguageServerId, Result, settings::LspSettings};

const LANGUAGE_SERVER_NAME: &str = "strz";
const LANGUAGE_SERVER_OVERRIDE: &str = "STRUCTURIZR_LSP_BIN";

struct StructurizrExtension;

impl StructurizrExtension {
    fn shell_env_var(shell_env: &[(String, String)], name: &str) -> Option<String> {
        shell_env
            .iter()
            .find_map(|(key, value)| (key == name).then_some(value.clone()))
    }

    fn language_server_command_config(
        &self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let binary_settings = LspSettings::for_worktree(language_server_id.as_ref(), worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.binary);
        let args = binary_settings
            .as_ref()
            .and_then(|binary_settings| binary_settings.arguments.clone())
            .unwrap_or_default();
        let shell_env = worktree.shell_env();

        if let Some(path) = binary_settings.and_then(|binary_settings| binary_settings.path) {
            if fs::metadata(&path).is_ok_and(|metadata| metadata.is_file()) {
                return Ok(zed::Command {
                    command: path,
                    args,
                    env: shell_env,
                });
            }

            Err(format!(
                "lsp.{}.binary.path points to a missing file: {path}",
                language_server_id.as_ref(),
            ))?;
        }

        if let Some(path) = Self::shell_env_var(&shell_env, LANGUAGE_SERVER_OVERRIDE) {
            if fs::metadata(&path).is_ok_and(|metadata| metadata.is_file()) {
                return Ok(zed::Command {
                    command: path,
                    args,
                    env: shell_env,
                });
            }

            Err(format!(
                "{LANGUAGE_SERVER_OVERRIDE} points to a missing file: {path}",
            ))?;
        }

        if let Some(path) = worktree.which(LANGUAGE_SERVER_NAME) {
            return Ok(zed::Command {
                command: path,
                args,
                env: shell_env,
            });
        }

        Err(format!(
            "could not find `{LANGUAGE_SERVER_NAME}`. Configure `lsp.{}.binary.path`, set {LANGUAGE_SERVER_OVERRIDE} before launching Zed, or put `{LANGUAGE_SERVER_NAME}` on PATH.",
            language_server_id.as_ref(),
        ))
    }
}

impl zed::Extension for StructurizrExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        self.language_server_command_config(language_server_id, worktree)
    }
}

zed::register_extension!(StructurizrExtension);
