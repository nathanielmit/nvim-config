-- set leader key
vim.g.mapleader = " "

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy plugins
require("plugins")
require("config.keymaps")

vim.opt.tabstop = 2       -- Number of visual spaces per TAB
vim.opt.softtabstop = 2   -- Number of spaces a <Tab> inserts in insert mode
vim.opt.shiftwidth = 2    -- Number of spaces for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.number = true
vim.opt.relativenumber = true

require("catppuccin").setup({
  flavour = "macchiato",
  background = {
    light = "latte",
    dark = "mocha",
  },
})
vim.cmd.colorscheme "catppuccin"

