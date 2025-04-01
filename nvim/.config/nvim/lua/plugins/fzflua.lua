return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>pf",
			function()
				require("fzf-lua").files()
			end,
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find nvim config",
		},
		{
			"<C-p>",
			function()
				require("fzf-lua").git_files()
			end,
		},
		{
			"<leader>ps",
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
	},
}
