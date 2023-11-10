local M = {}

---Copies a table recursivly copied from lua docs
---@param orig any # table to be copied
---@param copies? table # dunt know
---@return any # copied table or the input value if not a table
function M.deepcopy(orig, copies)
	copies = copies or {}
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		if copies[orig] then
			copy = copies[orig]
		else
			copy = {}
			copies[orig] = copy
			for orig_key, orig_value in next, orig, nil do
				copy[M.deepcopy(orig_key, copies)] = M.deepcopy(orig_value, copies)
			end
			setmetatable(copy, M.deepcopy(getmetatable(orig), copies))
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

---Split a string
---@param input string
---@param seperator string
---@return table
function M.split_str(input, seperator)
	if seperator == nil then
		seperator = "%s"
	end
	local t = {}
	for str in string.gmatch(input, "([^" .. seperator .. "]+)") do
		table.insert(t, str)
	end
	return t
end

return M
