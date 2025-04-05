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
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles/nvim/" })
			end,
			desc = "[F]ind [C]onfig (Neovim)",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep({ search = vim.fn.input("Grep > ") })
			end,
			desc = "[F]ile [S]earch",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles" })
			end,
			desc = "[F]ind [D]otfile",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Open Buffer",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltin",
		},
	},
}
