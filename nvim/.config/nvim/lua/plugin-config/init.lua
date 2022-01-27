local plugin_config = {
  "comment",
  "gitsigns",
  "indent-blankline",
  "lualine",
  "neogit",
  "nvim-cmp",
  "nvim-lspconfig",
  "palenight",
  "rainbow",
  "telescope"
}

for _, module in ipairs(plugin_config) do
  local ok, err = pcall(require, 'plugin-config/' .. module)
  if not ok then
    error("Error loading " .. module .. err)
  end
end
