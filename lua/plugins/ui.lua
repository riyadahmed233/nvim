return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  -- Mini icons
{ 'echasnovski/mini.nvim', version = false },

-- Which Key
{
  "folke/which-key.nvim",
  event = "VeryLazy",
},

-- Telescope + Treesitter
{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
 {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
},
{
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},

-- Undo tree

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      require "custom.inits.undotree"
    end,
  },

}
