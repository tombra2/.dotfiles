return {
	"stevearc/conform.nvim",
	opts = {

		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettier" },
			css = { "prettier" },
			php = { "php_cs_fixer" },
			java = { "clang-format" },
			sh = { "shfmt" },
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
