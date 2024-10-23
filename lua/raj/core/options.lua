vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- hide default status bars mode indicator
opt.showmode = false

-- generic settings
opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wraping
opt.wrap = false


-- mouse tweak
opt.mouse = 'a'  -- Enable mouse support for all modes


-- searching
opt.ignorecase = true
opt.smartcase = true


-- apearence options
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no" -- toggle it to yes for left side margin space

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as main register

-- split window
opt.splitright = true
opt.splitbelow = true



