local default_schemas = nil
local status_ok, yamlls_settings = pcall(require, "nlspsettings.yamlls")
if status_ok then
  default_schemas = yamlls_settings.get_default_schemas()
end

local schemas = {
  {
    description = "Kubernetes schema",
    fileMatch = {
      -- "yaml",
      -- "yml",
      "/*.k8s.yaml",
    },
    url = "https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json",
  },
}
