local plugins = {
  {
    'iruzo/matrix-nvim',
    lazy=false,
    priority=1000,
    config = function()
      vim.cmd([[colorscheme matrix]])
    end,
  },
  {
		"kdheepak/lazygit.nvim",
    event = "VeryLazy",
		cmd = {
			"LazyGit",
			"LazyGitCurrentFile",
			"LazyGitFilterCurrentFile",
			"LazyGitFilter",
		},
		keys = {
			{ "<Leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
		end,
	},

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
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
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "mharington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapater",
        "prettier",
        "typescript-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
}

return plugins
