return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set({ "i", "n" }, "<C-c>h", "<Esc>:TmuxNavigateLeft<CR>"),
	vim.keymap.set({ "i", "n" }, "<C-c>j", "<Esc>:TmuxNavigateDown<CR>"),
	vim.keymap.set({ "i", "n" }, "<C-c>k", "<Esc>:TmuxNavigateUp<CR>"),
	vim.keymap.set({ "i", "n" }, "<C-c>l", "<Esc>:TmuxNavigateRight<CR>"),
}
