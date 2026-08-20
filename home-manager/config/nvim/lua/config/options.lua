vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.winborder = "rounded"
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.undofile = true

vim.opt.showmode = false
vim.opt.completeopt = "nosort,fuzzy,menuone,noselect"
vim.opt.cmdheight = 0
vim.opt.guicursor = ""

vim.diagnostic.config({
    virtual_text = { source = false },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
