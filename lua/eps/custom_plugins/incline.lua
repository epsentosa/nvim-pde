local MAX_LENGTH_FULLPATH = 36

local get_modified_filepath = function(file_path)
	local dirs = {}

	if string.find(file_path, "/") == nil then
		return file_path
	else
		for dir in string.gmatch(file_path, "[^/]+") do
			table.insert(dirs, dir)
		end
	end

	local filename = dirs[#dirs]
	dirs[#dirs] = nil
	local modified_path = ""
	for _, dir in ipairs(dirs) do
		local first_char = string.sub(dir, 1, 1)
		modified_path = modified_path .. first_char .. "/"
	end

	return modified_path .. filename
end

local get_filepath = function(bufname)
	local file_path = bufname ~= "" and vim.fn.fnamemodify(bufname, ":.")

	if file_path then
		if #file_path <= MAX_LENGTH_FULLPATH then
			return file_path
		else
			return get_modified_filepath(file_path)
		end
	else
		return "[No Name]"
	end
end

local render = function(props)
	local bufname = vim.api.nvim_buf_get_name(props.buf)
	local filename = get_filepath(bufname)
	local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

	local result = {
		{ filetype_icon, guifg = color },
		{ " " },
		{ filename },
	}

	if vim.api.nvim_buf_get_option(props.buf, "modified") then
		table.insert(result, " [+]")
	end

	return result
end

require("incline").setup({
	render = render,
	window = {
		margin = {
			horizontal = { left = 0, right = 1 },
		},
		padding = { left = 0, right = 1 },
		zindex = 25,
	},
})
