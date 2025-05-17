return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",

    -- Show Signature Help on insert Mode
    -- "ray-x/lsp_signature.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("eps.custom_plugins.lsp")
	end,
}
