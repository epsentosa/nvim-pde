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
		nes = {
			enabled = true,
			keymap = {
				accept_and_goto = "<Tab>",
				accept = false,
				dismiss = "<Esc>",
			},
		},
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
