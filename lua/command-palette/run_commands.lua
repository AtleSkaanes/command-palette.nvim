local run_commands = {}

---Turn a command type into a string
---@param command command # The input data from the user
---@return string? # The resulting command from the input data if nil then there is an error
local function command_data_to_str(command)
	local command_type = type(command)

	if command_type == "string" then
		return command
	end

	if command_type == "table" then
		local out = command[1]
		for i = 2, #command, 1 do
			if type(command[i]) ~= "string" then
				return nil
			end

			out = out .. " " .. command[i]
		end
		return out
	end

	if command_type == "function" then
		local return_value = command()
		local return_type = type(return_value)

		if return_type == "string" then
			return return_value
		end

		if return_type == "table" then
			local out = return_value[1]
			for i = 2, #return_value, 1 do
				if type(return_value[i]) ~= "string" then
					return nil
				end

				out = out .. " " .. return_value[i]
			end
			return out
		end
	end
	return nil
end

---Run a command via it's name
---@param cmdPalette CmdPalette
---@param name string
function run_commands.by_name(cmdPalette, name)
	for _, commandData in ipairs(cmdPalette.commands) do
		if commandData.name == name then
			---@type string?
			local commandStr = command_data_to_str(commandData.cmd)
			if commandStr == nil then -- Something is wrong with the command input
				local error_msg = string.format("Invalid command given, command name: %s", commandData.name)
				return vim.notify(error_msg, vim.log.levels.ERROR, { title = "command-palette.nvim" })
			end

			print(commandStr)
		end
	end
end

return run_commands