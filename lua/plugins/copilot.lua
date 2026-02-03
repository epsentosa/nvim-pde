local config = function()
	require("copilot").setup({
		suggestion = {
			enabled = not vim.g.ai_cmp,
			auto_trigger = true,
			hide_during_completion = vim.g.ai_cmp,
			keymap = {
				accept = "<Tab>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		-- nes = { --still not stable
		-- 	enabled = true,
		-- 	keymap = {
		-- 		accept_and_goto = "<leader>y",
		-- 		accept = false,
		-- 		dismiss = "<Esc>",
		-- 	},
		-- },
    copilot_model = 'claude-sonnet-4.5',
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	})
end

return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		{
			"copilotlsp-nvim/copilot-lsp",
			init = function()
				vim.g.copilot_nes_debounce = 500
			end,
		},
	},
	config = config,
	cmd = "Copilot",
}
