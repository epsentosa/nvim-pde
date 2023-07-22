return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",

    -- Show Signature Help on insert Mode
    "ray-x/lsp_signature.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("eps.custom_plugins.lsp")
	end,
}
