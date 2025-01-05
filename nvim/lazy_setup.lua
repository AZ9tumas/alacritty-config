require("lazy").setup({

  {
    "preservim/nerdtree",
  },

  { "nvim-treesitter/nvim-treesitter" }, 

  --[ THEMES ]]
  
  { "cpea2506/one_monokai.nvim", priority = 1000 },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { "Shatur/neovim-ayu", priority = 1000 },

  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'darker'  -- Options: 'dark', 'darker', 'cool', 'deep', etc.
      }
      require('onedark').load()
    end,
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },

  { "sonph/onehalf", priority = 1000},
  { "rakr/vim-one", priority = 1000 },
  
  {
    "olimorris/onedarkpro.nvim",
      priority = 1000, -- Ensure it loads first
  },
  
  --[[ ======================================== ]]
  
  --[[ Arduino.nvim   
  { "glebzlat/arduino-nvim", 
    config = {
      function() require("arduino-nvim").setup() end,
      filetype = "arduino"
    }
  },
 ]]--

  { "sudar/vim-arduino-syntax" },
  {
    "AstroNvim/AstroNvim",
    version = "^4", -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
