
-- Only required if you have packer configured as `opt`

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
    }
 
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('IndianBoy42/tree-sitter-just')
  use({
      "Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
		    enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
            trigger_events = {"InsertLeave", "TextChanged","TextChangedI"}, -- vim events that trigger auto-save. See :h events
	        condition = function(buf)
		    local fn = vim.fn
		    local utils = require("auto-save.utils.data")

		    if
			  fn.getbufvar(buf, "&modifiable") == 1 and
			  utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			  return true -- met condition(s), can save
		    end
		    return false -- can't save
	     end,
        write_all_buffers = false, -- write all buffers when the current one meets `condition`
        debounce_delay = 1, -- saves the file at most every `debounce_delay` milliseconds
	     callbacks = { -- functions to be executed at different intervals
		 enabling = nil, -- ran when enabling auto-save
		 disabling = nil, -- ran when disabling auto-save
		 before_asserting_save = nil, -- ran before checking `condition`
		 before_saving = nil, -- ran before doing the actual save
    	 after_saving = nil -- ran after doing the actual save
	     }
		 }
	end,
    })  
   use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

end)
