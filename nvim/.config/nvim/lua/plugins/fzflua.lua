return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles/nvim/" })
			end,
			desc = "Find nvim config",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep({ search = vim.fn.input("Grep > ") })
			end,
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles" })
			end,
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
		},
	},
}
