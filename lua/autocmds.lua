
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

vim.cmd [[
    augroup PHBSCF
        autocmd!
        autocmd BufWritePost,BufReadPost,InsertLeave *.php :lua require'phpcs'.cs()
        autocmd BufWritePost *.php :lua require'phpcs'.cbf()
    augroup END
]]

-- Autocommand that adds highlights to trailing whitespaces after colorscheme changed
vim.cmd [[
  augroup highlight_colorscheme
    au!
    au ColorScheme * silent! execute matchadd("ErrorMsg", "\\s\\+$")
  augroup end
]]

vim.cmd [[
    let g:nvim_phpcs_config_phpcs_path = 'phpcs'
    let g:nvim_phpcs_config_phpcbf_path = 'phpcbf'
    let g:nvim_phpcs_config_phpcs_standard = 'PSR2'
]]
