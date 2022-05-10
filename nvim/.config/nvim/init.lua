local config_modules = {
  'colorscheme',
  'settings',
  'mappings',
  'plugins',
  'plugin-config'
}

for _, module in ipairs(config_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. err)
  end
end
