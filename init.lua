-- Set leader key
vim.g.mapleader = " "

-- Load Lazy
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("plugins")
require("config.keymaps")

vim.opt.tabstop = 2       -- Number of visual spaces per TAB
vim.opt.softtabstop = 2   -- Number of spaces a <Tab> inserts in insert mode
vim.opt.shiftwidth = 2    -- Number of spaces for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
require("catppuccin").setup({
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "mocha"
	},

})
vim.cmd.colorscheme "catppuccin"
