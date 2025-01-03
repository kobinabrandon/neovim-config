return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {stay_on_this_version = true},
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      -- { '<leader>vc', '<cmd>VenvCache<cr>' },
    }
  },

  {
    "NeogitOrg/neogit",
    dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"},
    config = true,
    keys = {
      { '<leader>vc', '<cmd>Neogit<cr>'},
    }

  },

  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
        vim.cmd.colorscheme "aurora"
        -- override defaults
        vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
    end
  },

  {
    "nvzone/timerly",
    dependencies = {"nvzone/volt"},
    keys = {
      {'<leader>tt', '<cmd>TimerlyToggle<cr>'}
    },
  },

  {
    "atiladefreitas/dooing",
    keys = {
      {'<leader>do', '<cmd>Dooing<cr>'}
    }
  },

  {"folke/tokyonight.nvim"},

  {
    "danymat/neogen",
    opts={ noremap = true, silent = true},
    keys = {
      {'<leader>dc', "<cmd>:lua require('neogen').generate()<CR>"}
    },
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  }

}



 -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
