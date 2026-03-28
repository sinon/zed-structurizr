(comment) @comment

(string) @string

(text_block_string) @string

(hex_color) @string.special

(named_color) @string.special

(shape_value) @string.special

(border_value) @string.special

(icon_position_value) @string.special

(line_style_value) @string.special

(routing_value) @string.special

(boolean_value) @constant.builtin

(number) @number

(order) @number

(wildcard) @constant.builtin

(layout_direction) @constant.builtin

(this_keyword) @variable.special

(relationship_operator) @operator

(default_statement) @keyword

[
  "!const"
  "!constant"
  "!include"
  "!identifiers"
  "!impliedRelationships"
  "!docs"
  "!adrs"
  "!var"
  "!elements"
  "!element"
  "!relationships"
] @preproc

[
  "workspace"
  "extends"
  "model"
  "views"
  "configuration"
  "archetypes"
  "enterprise"
  "person"
  "softwareSystem"
  "softwaresystem"
  "container"
  "component"
  "deploymentEnvironment"
  "deploymentGroup"
  "deploymentNode"
  "infrastructureNode"
  "containerInstance"
  "softwareSystemInstance"
  "description"
  "technology"
  "tag"
  "tags"
  "metadata"
  "url"
  "name"
  "title"
  "include"
  "exclude"
  "autoLayout"
  "autolayout"
  "animation"
  "systemLandscape"
  "systemlandscape"
  "systemContext"
  "systemcontext"
  "filtered"
  "dynamic"
  "deployment"
  "custom"
  "styles"
  "branding"
  "terminology"
  "light"
  "dark"
  "element"
  "relationship"
  "group"
  "instanceOf"
  "properties"
  "perspectives"
  "perspective"
  "healthCheck"
  "theme"
  "themes"
  "plantuml"
  "mermaid"
  "kroki"
  "image"
  "scope"
  "visibility"
  "users"
] @keyword

; Match unquoted `url https://...` values explicitly because they still parse as
; `bare_value` at the grammar layer.
(url_statement
  value: [
    (bare_value)
    (string)
  ] @string.special.url)

[
  "{"
  "}"
] @punctuation.bracket

":" @punctuation.delimiter

"=" @operator

"->" @operator

(person
  identifier: (identifier) @type)

(software_system
  identifier: (identifier) @type)

(container
  identifier: (identifier) @type)

(component
  identifier: (identifier) @type)

(custom_element
  identifier: (identifier) @type)

(archetype_definition
  identifier: (identifier) @type)

(archetype_instance
  kind: (identifier) @type)

(deployment_environment
  identifier: (identifier) @type)

(deployment_group
  identifier: (identifier) @type)

(deployment_node
  identifier: (identifier) @type)

(infrastructure_node
  identifier: (identifier) @type)

(container_instance_simple
  (identifier) @type)

(container_instance_grouped
  (identifier) @type)

(software_system_instance_simple
  (identifier) @type)

(software_system_instance_grouped
  (identifier) @type)

(relationship
  source: (identifier) @type
  destination: (identifier) @type)

(dynamic_relationship
  source: (identifier) @type
  destination: (identifier) @type)

(dynamic_relationship_reference
  relationship: (identifier) @type)

(animation_block
  value: (identifier) @type)

(style_setting
  name: (identifier) @property)

(property_entry
  name: [
    (identifier)
    (bare_value)
    (string)
  ] @property)
