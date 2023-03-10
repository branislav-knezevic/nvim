local status_ok, filetype = pcall(require, "Filetype")
if not status_ok then
  return
end

-- filetype.setup {
--   overrides = {
--     extensions = {
--       tf = "terraform",
--       tfvars = "terraform",
--       tfstate = "json",
--       hcl = "hcl",
--     },
--   },
-- }
vim.filetype.add {
    extension = {
        fish = "fish",
        tf = "terraform",
        tfvars = "terraform",
        tfstate = "json",
        eslintrc = "json",
        prettierrc = "json",
        mdx = "markdown",
    },
    filename = {
        ["kitty.conf"] = "kitty",
        [".gitignore"] = "conf",
    },
    pattern = {
        [".clang*"] = "yaml",
        [".*%.env.*"] = "sh",
        [".*ignore"] = "conf",
        [".*enkinsfile.*"] = "groovy",
    },
}
