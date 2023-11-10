local M = {}

---Copies a table
---@param table table # table to be copied
---@return table # copied table
function M.deepcopy(table)
	if type(table) ~= "table" then
		return
	end
end

return M
