(workspace
  "workspace" @context
  name: (_) @name) @item

(workspace
  "workspace" @name) @item

(model
  "model" @name) @item

(views
  "views" @name) @item

(branding
  "branding" @name) @item

(terminology
  "terminology" @name) @item

(styles
  "styles" @name) @item

(configuration
  "configuration" @name) @item

(archetypes
  "archetypes" @name) @item

(person
  "person" @context
  name: (_) @name) @item

(enterprise
  "enterprise" @context
  name: (_) @name) @item

(software_system
  [
    "softwareSystem"
    "softwaresystem"
  ] @context
  name: (_) @name) @item

(container
  "container" @context
  name: (_) @name) @item

(component
  "component" @context
  name: (_) @name) @item

(custom_element
  "element" @context
  name: (_) @name) @item

(deployment_environment
  "deploymentEnvironment" @context
  name: (_) @name) @item

(deployment_node
  "deploymentNode" @context
  name: (_) @name) @item

(infrastructure_node
  "infrastructureNode" @context
  name: (_) @name) @item

(container_instance
  (container_instance_simple
    target: (identifier) @name)) @item

(container_instance
  (container_instance_grouped
    target: (identifier) @name)) @item

(software_system_instance
  (software_system_instance_simple
    target: (identifier) @name)) @item

(software_system_instance
  (software_system_instance_grouped
    target: (identifier) @name)) @item

(system_landscape_view
  "systemLandscape" @name) @item

(system_context_view
  "systemContext" @context
  scope: (identifier) @name) @item

(container_view
  "container" @context
  scope: (identifier) @name) @item

(component_view
  "component" @context
  scope: (identifier) @name) @item

(filtered_view
  "filtered" @context
  base_key: (_) @name) @item

(dynamic_view
  "dynamic" @context
  scope: (_) @name) @item

(deployment_view
  "deployment" @context
  environment: (_) @name) @item

(custom_view
  "custom" @name) @item

(image_view
  "image" @context
  scope: (_) @name) @item

(element_style
  "element" @context
  tag: (_) @name) @item

(relationship_style
  "relationship" @context
  tag: (_) @name) @item

(light_styles
  "light" @name) @item

(dark_styles
  "dark" @name) @item
