local plugin_config = {
  "comment",
  "gitsigns",
  "indent-blankline",
  "lualine",
  "luasnip",
  "neotree",
  "nvim-autopairs",
  "nvim-cmp",
  "nvim-lspconfig",
  "rainbow",
  "rest-nvim",
  "telescope",
  "treesitter-context",
  "treesitter"
}

for _, module in ipairs(plugin_config) do
  local ok, err = pcall(require, 'plugin-config/' .. module)
  if not ok then
    error("Error loading " .. module .. err)
  end
end
