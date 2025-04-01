return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"lua",
				"java",
				"vim",
				"html",
				"css",
				"sql",
				"python",
				"php",
				"java",
				"twig",
				"csv",
				"markdown",
				"cpp",
				"arduino",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}
