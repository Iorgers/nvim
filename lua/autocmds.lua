
-- Highlight yanked text for a couple of milleseconds
vim.cmd [[
  augroup user_yank_highlight
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup end
]]

-- Enable cursorline for current buffer only

-- vim.cmd [[
--  augroup user_cursorline
--    au!
--    au BufEnter * silent! set cursorline
--    au BufLeave * silent! set nocursorline
--  augroup end
-- ]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    au!
    au BufWritePost plugins.lua source <afile> | Lazy
  augroup end
]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    au!
    au TermOpen * :set nonumber | set norelativenumber | set showtabline=1 | norm i
    au TermClose * :set number | set relativenumber | set showtabline=2
  augroup end
]]

-- Autocommand that adds highlights to trailing whitespaces after colorscheme changed
-- And also makes background transparent
vim.cmd [[
  augroup highlight_colorscheme
    au!
    au ColorScheme * silent! execute matchadd("ErrorMsg", "\\s\\+$")
    au ColorScheme * silent! execute "hi Normal guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi NormalNC guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi TabLineFill guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi TabLine guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi TabLineSel guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi NotifyBackground guibg=NONE ctermbg=NONE"
    au ColorScheme * silent! execute "hi clear NotifyINFOBorder guibg=NONE ctermbg=NONE"
  augroup end
]]
