-- set leader key
vim.g.mapleader = " "
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "popup" }
vim.g.copilot_no_tab_map = true

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

require("onedark").setup({
  style = "deep", -- Choose from 'darker', 'deep', 'cool', 'warm', 'warmer', 'light'
  transparent = true, -- Enable transparent background
  term_colors = true, -- Enable terminal colors
  ending_tildes = true, -- Show tildes at the end of the buffer
  cmp_itemkind_reverse = false, -- Reverse item kind in completion menu
  diagnostics = {
    darker = true, -- Use darker colors for diagnostics
    undercurl = true, -- Use undercurl for diagnostics
    background = true, -- Use background color for diagnostics
  },
  lualine = {
    transparent = false, -- Make lualine background transparent
  },
  styles = {
    comments = "italic", -- Style for comments
    keywords = "bold", -- Style for keywords
    functions = "italic,bold", -- Style for functions
    variables = "NONE", -- Style for variables
    sidebars = "dark", -- Style for sidebars and floats
    floats = "dark", -- Style for floating windows
  },
  
})
vim.cmd.colorscheme "onedark"

