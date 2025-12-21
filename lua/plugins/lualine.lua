-- Color for highlights
local colors = {
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local config = function()
	local lualine_config = {
		options = {
			icons_enabled = true,
			component_separators = { left = " ▏", right = " ▏" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_x = {
				{
					"copilot",
					-- Default values
					symbols = {
						status = {
							icons = {
								enabled = " ",
								sleep = " ", -- auto-trigger disabled
								disabled = " ",
								warning = " ",
								unknown = " ",
							},
							hl = {
								enabled = require('copilot-lualine.colors').get_hl_value(0, "DiagnosticWarn", "fg"),
								sleep = "#AEB7D0",
								disabled = "#6272A4",
								warning = "#FFB86C",
								unknown = "#FF5555",
							},
						},
						spinners = "dots", -- has some premade spinners
						spinner_color = "#6272A4",
					},
					show_colors = false,
					show_loading = true,
				},
				"encoding",
				"filetype",
			},
			lualine_c = {},
		},
	}
	require("lualine").setup(lualine_config)
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine", -- copilot lualine integration
	},
	config = config,
}
