local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"


require("lazy").setup({
  -- Git
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim", config = function() require("config.git") end },
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- File Tree
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function() require("config.tree") end },

  -- UI & Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "terraform", "hcl", "lua", "bash", "json" }, -- add others as needed
      highlight = { enable = true },
    },
  },
  { "nvim-treesitter/playground" }, -- optional: inspect parse tree
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- OneDark Theme
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      require('onedark').load()
    end
  },

  -- LSP / Dev Tools
  { "neovim/nvim-lspconfig", config = function() require("config.lsp") end },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },


  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      { "<leader>ce", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain selected code" },
      { "<leader>cq", ":CopilotChat<CR>", desc = "Open Copilot Chat" },
    },
  },



  -- Searching
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()

    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    })
    require("telescope").load_extension("ui-select")
    -- Keymaps
    local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (project search)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
      vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Search commands" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    end
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- Tmux 
  { 'alexghergh/nvim-tmux-navigation', config = function()

      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
          disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

  end
  }
})
