vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark" -- light & dark color schemes will default to dark
vim.opt.signcolumn = "yes"

-- uncomment if company styleguide requires a certain amount of code per line
-- vim.opt.colorcolumn = "80"

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- include dash as part of a vim 'word'
vim.opt.iskeyword:append("-")

-- map leader
vim.g.mapleader = " "
