local M = {}

function M.dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. M.dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

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

---Overrides the orig table with the values from the override table
---@param orig any | table # the table or value to override
---@param override table # the table with the overide values
---@return table # the overwritten table
function M.deep_override(orig, override)
	-- No table to override, just return the overide
	if type(orig) ~= "table" then
		return override
	end

	-- Copy the table so not to change original
	local new = M.deepcopy(orig)
	for key, value in pairs(override) do
		if type(key) == "number" then
			table.insert(new, value)
			goto continue
		end
		-- If the value is a table override that as well
		if type(value) == "table" then
			new[key] = M.deep_override(new[key], value)
		elseif value ~= nil then -- If the value is not a table set the value directly
			new[key] = value
		end
		::continue::
	end

	return new
end

return M
