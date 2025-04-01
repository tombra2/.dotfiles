return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "<C-c>h", ":TmuxNavigateLeft<CR>"),
	vim.keymap.set("n", "<C-c>j", ":TmuxNavigateDown<CR>"),
	vim.keymap.set("n", "<C-c>k", ":TmuxNavigateUp<CR>"),
	vim.keymap.set("n", "<C-c>l", ":TmuxNavigateRight<CR>"),
}
