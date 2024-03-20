return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },

  ----Language Server Protocol
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },


  ---- 功能拓展
  -- 函数签名
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  -- 补全
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    'saadparwaiz1/cmp_luasnip',
  },
  -- 文件管理器
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- 括号补全
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  -- 便捷注释
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },


  ---- 美化
  -- 主题
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme onedark]])
    end,
  },
  -- 顶栏
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- 底栏
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- 竖线对齐
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
  },
}
