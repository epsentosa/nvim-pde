local harpoon = require("harpoon")

local args = vim.v.argv
if args[3] == "--" then
	if #harpoon:list().items ~= 0 then
		harpoon:list():select(1)
		vim.cmd([[ bd # ]])
	else
		vim.cmd([[ Oil ]])
	end
end
