vim.cmd "let $NVIM_TUI_ENABLE_TRUE_COLOR=1" -- True color for iTerm https://medium.com/@ericclifford/neovim-item2-truecolor-awesome-70b975516849

-- Color Scheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local colorscheme  = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found!")
  return
end


