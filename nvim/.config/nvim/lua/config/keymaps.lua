local M = {}

vim.keymap.set({ "i", "n" }, "<C-b>", vim.cmd.Ex)
vim.keymap.set({ "i", "n", "v" }, "<C-s>", "<Esc><cmd>w<CR>")
vim.keymap.set({ "i", "n" }, "<C-q>", "<cmd>wq!<CR>")
vim.keymap.set({ "i", "n" }, "<C-q>q", "<cmd>q!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

function M.setup_lsp_keymaps(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
	local function client_supports_method(client, method, bufnr)
		if vim.fn.has("nvim-0.11") == 1 then
			return client:supports_method(method, bufnr)
		else
			return client.supports_method(method, { bufnr = bufnr })
		end
	end
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if
		client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
	then
		local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})
		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
			end,
		})
	end
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
	map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")
	map("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
	if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end, "[T]oggle Inlay [H]ints")
	end
	map("<leader>ws", require("fzf-lua").lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	map("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
	map("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
	map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
end

return M
