---------------------------------------------------------------
-- General Settings
---------------------------------------------------------------

-- disable sounds
vim.cmd([[ set noerrorbells ]])

-- setting tab size and so on
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto indent
vim.opt.smartindent = true

-- displays current line number
vim.opt.nu = true

-- disables --INSERT--
vim.cmd([[ set noshowmode ]])

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
