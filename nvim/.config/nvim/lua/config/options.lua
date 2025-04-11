-- Aktiviert Nerd Font Unterstützung und Terminal Colors
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
-- Anzeigeeinstellungen
vim.opt.number = true -- Zeilennummern anzeigen
vim.opt.relativenumber = true -- Relative Zeilennummern aktivieren
vim.opt.list = true -- Nicht druckbare Zeichen anzeigen
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Darstellung nicht druckbarer Zeichen
vim.opt.signcolumn = "yes" -- Zeichen-Spalte immer anzeigen
vim.opt.showmode = false -- Modus nicht in der Statuszeile anzeigen (da bereits vorhanden)
vim.opt.numberwidth = 2

-- Suchverhalten
vim.opt.ignorecase = true -- Suche ist standardmäßig nicht zwischen Groß- und Kleinschreibung unterscheidend
vim.opt.smartcase = true -- Falls ein Großbuchstabe in der Suche, wird die Suche groß-/kleinschreibungssensitiv
vim.opt.hlsearch = false -- Suchbegriffe nicht dauerhaft hervorheben
vim.opt.incsearch = true -- Inkrementelle Suche aktivieren

-- Einrückungen und Tabulatoren
vim.opt.tabstop = 4 -- Tabulatorweite auf 4 setzen
vim.opt.softtabstop = 4 -- Softtabulatorweite auf 4 setzen
vim.opt.shiftwidth = 4 -- Einrückungsweite auf 4 setzen
vim.opt.expandtab = true -- Tabulatoren durch Leerzeichen ersetzen
vim.opt.autoindent = true -- Automatische Einrückung aktivieren
vim.opt.smartindent = true -- Intelligente Einrückung aktivieren
vim.opt.smarttab = true -- Intelligentes Tabulatorverhalten aktivieren
vim.opt.breakindent = true -- Zeilenumbrüche einrücken

-- Verhalten bei Splits
vim.opt.splitright = true -- Neue vertikale Splits rechts öffnen
vim.opt.splitbelow = true -- Neue horizontale Splits unten öffnen

-- Sonstige Optionen
vim.opt.mouse = "a" -- Maussteuerung überall aktivieren
vim.opt.undofile = true -- Änderungen in einer Undo-Datei speichern
vim.opt.scrolloff = 8 -- Mindestens 10 Zeilen über/unter dem Cursor anzeigen

-- Nach kopieren wird ein kurzes Highlighten des Textes angezeigt
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yank",
})
vim.opt.clipboard = "unnamedplus"
