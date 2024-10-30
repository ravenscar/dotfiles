vim.filetype.add({
  extension = {
    ejs = 'embedded_template',
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "css",
    "dockerfile",
    "embedded_template",
    "go",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "scss",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
});

local plugins = {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
  "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
    },
  },
  {
    "ThePrimeagen/harpoon",
    cmd = "Harpoon"
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
       return require "custom.configs.telescope"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "typescript-language-server",
        "pyright",
        "mypy",
        "ruff",
        "ocaml-lsp",
        "gopls",
        "zls",
        "json-lsp"
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
return plugins
