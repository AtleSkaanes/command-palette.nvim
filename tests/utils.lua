local utils = require("command-palette.utils")

local function tables_eq(table1, table2)
	for key, value in pairs(table1) do
		if type(value) == "table" then
			if not tables_eq(value, table2[key]) then
				return false
			end
		else
			if table2[key] ~= value then
				return false
			end
		end
	end

	return true
end

local function test_deepcopy(table)
	local copy_table = utils.deepcopy(table)
	return tables_eq(copy_table, table)
end

---Tests if the utils.deep_override function works
---@param table1 table # First table to be overwritten
---@param table2 any # Second table to overide table1 with
---@return boolean # If the override worked
local function test_deep_override(table1, table2, result)
	local override = utils.deep_override(table1, table2)

	return tables_eq(override, result)
end

local deepcopy = test_deepcopy({
	foo = true,
	baz = 34,
	fuzz = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
	},
	bazz = {
		foo = 3,
		fuzzbazz = {
			id = 55,
			bru = "joe",
		},
	},
})

local override = test_deep_override({
	id = 55,
	tbl = {
		thing = 5,
		other = 2,
	},
	tbl_tbl = {
		{
			name = "jhonny",
			hobby = true,
		},
	},
}, {
	id = 33,
	tbl = {
		thing = true,
		my_val = 3.1415,
	},
	tbl_tbl = {
		{
			name = "Bo boolean",
			hobby = false,
			adress = 34,
		},
	},
	last_thing = "YES!",
}, {
	id = 33,
	tbl = {
		thing = true,
		other = 2,
		my_val = 3.1415,
	},
	tbl_tbl = {
		{
			name = "jhonny",
			hobby = true,
		},
		{
			name = "Bo boolean",
			hobby = false,
			adress = 34,
		},
	},
	last_thing = "YES!",
})

local test_str = string.format("deepcopy: %s, override: %s", tostring(deepcopy), tostring(override))

vim.notify(test_str, vim.log.levels.INFO)
