return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("brew.lsp")
	end,
}
