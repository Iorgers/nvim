local options = {
  termguicolors=true,

  tabstop=4,
  shiftwidth=4,
  softtabstop=4,
  expandtab=true,

  number=true,
  relativenumber=true,

  cursorline=false,

  signcolumn="no",

  path=".,**",

  list=true,

  guicursor="",

  wrap=false,

  swapfile=false,
  backup=false,

  smartindent=true,

  hlsearch=false,
  incsearch=true,

  undodir=os.getenv("HOME") .. "/.vim/undodir",
  undofile=true,

  scrolloff = 8,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
