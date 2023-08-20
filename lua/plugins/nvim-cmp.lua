return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lua", -- source for file lua nvim
		"hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
		"onsails/lspkind.nvim",
	},
	event = "BufReadPre",
	config = function()
		require("eps.custom_plugins.cmp")
	end,
}
