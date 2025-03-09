vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "


-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"


-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  {
    { "nvzone/timerly", dependencies = {"nvzone/volt"} }
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


require('lspconfig').basedpyright.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}


require('lspconfig').gopls.setup {}

require("dooing").setup({})

require('neogen').setup {
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "emmylua"
            }
        },

        python = {
            template = {
                  annotation_convention = "google_docstrings"
            }
        },

    }
}


require('git-conflict').setup({
  default_mappings = true,  -- Enable default mappings
  default_commands = true,  -- Enable default commands
  disable_diagnostics = false,  -- Disable diagnostics if you prefer
  highlights = {  -- Customize highlight groups
    incoming = 'DiffAdd',
    current = 'DiffText',
  },
})


vim.keymap.set('n', '<leader>gcl', '<cmd>GitConflictList<cr>', { desc = 'Choose Ours' })
vim.keymap.set('n', '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', { desc = 'Choose Ours' })
vim.keymap.set('n', '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', { desc = 'Choose Theirs' })
vim.keymap.set('n', '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', { desc = 'Choose Both' })
vim.keymap.set('n', '<leader>gcn', '<cmd>GitConflictNextConflict<cr>', { desc = 'Next Conflict' })
vim.keymap.set('n', '<leader>gcp', '<cmd>GitConflictPrevConflict<cr>', { desc = 'Previous Conflict' })

vim.cmd.colorscheme "aurora"
