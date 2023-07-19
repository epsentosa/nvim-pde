local config = function()
	require("treesitter-context").setup({
		enable = false,
		max_lines = 6,
	})
end

return {
	"nvim-treesitter/nvim-treesitter-context",
	config = config,
	cmd = { "TSContextToggle", "TSContextEnable" },
}
