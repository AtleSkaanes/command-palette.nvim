local M = {}

---@param commands CommandData[]
local convert_to_tree = function(commands)
	local tree = {}
	for _, v in pairs(commands) do
		if v.category ~= nil or v.category == "" or v.category == " " then
			if tree[v.category] == nil then
				tree[v.category] = {}
			end
			table.insert(tree[v.category], 0, v)
		else
			table.insert(tree, 0, v)
		end
	end
	return tree
end

---@param branch table
local get_commands_from_branch = function(branch)
	local categories = {}
	local cmds = {}
	for k, v in pairs(branch) do
		-- If this is a category
		if type(k) == "string" then
			table.insert(categories, k)
		else
			table.insert(cmds, v)
		end
	end
	table.sort(categories)
	table.sort(cmds, function(a, b)
		return a.name < b.name
	end)
	for _, v in ipairs(cmds) do
		table.insert(categories, v)
	end
	return categories
end

---@param category string
function M.get_commands(category)
	local t = {}
	local commands = require("command-palette").opts.commands
	if commands == nil then
		return t
	end
	local tree = convert_to_tree(commands)
	if category == "root" then
		t = get_commands_from_branch(tree)
	elseif tree[category] ~= nil then
		t = get_commands_from_branch(tree[category])
		table.insert(t, 1, "..")
	end
	return t
end

---@param name string
---@param category? string
function M.get_cmd_by_name(name, category)
	local commands = require("command-palette").opts.commands
	for _, v in commands do
		if v.name == name and v.category == category then
			return v
		end
	end
	return nil
end

return M
