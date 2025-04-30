return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Custom Formatters per Filetype
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      lua = { "stylua" },
      html = { "prettier" },
      twig = { "twig-cs-fixer" },
      css = { "prettier" },
      php = { "php_cs_fixer" },
      java = { "clang-format" },
      sh = { "shfmt" },
      json = { "prettier" },
    })
  end,
}
