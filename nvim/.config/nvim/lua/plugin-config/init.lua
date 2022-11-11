local plugin_config = {
  "comment",
  "dap",
  "gitsigns",
  "indent-blankline",
  "lualine",
  "luasnip",
  "neotest",
  "neotree",
  "nvim-autopairs",
  "nvim-cmp",
  "nvim-lspconfig",
  "nvim-surround",
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
