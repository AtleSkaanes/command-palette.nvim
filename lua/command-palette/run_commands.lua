local job = require("plenary.job")
local utils = require("command-palette.utils")

local run_commands = {}

---@type boolean
run_commands.is_setup = false
---@type CommandData[]
run_commands.commands = nil

---Turn a command type into a string
---@param command command # The input data from the user
function run_commands.from_commmandData(command)
	if not run_commands.is_setup then
		return vim.notify(
			"You need to setup command-palette before running commands",
			vim.log.levels.ERROR,
			{ title = "command-palette" }
		)
	end

	local command_type = type(command)

	if command_type == "string" then
		local args = utils.split_str(command, " ")
		local cmd = table.remove(args, 1)

		run_commands.by_cmd_args(cmd, args)
		return
	end

	if command_type == "table" then
		local args = utils.deepcopy(command)
		local cmd = table.remove(args, 1)

		run_commands.by_cmd_args(cmd, args)
		return
	end

	if command_type == "function" then
		local return_value = command()
		local return_type = type(return_value)

		if return_type == "string" then
			local args = utils.split_str(return_value, " ")
			local cmd = table.remove(args, 1)

			run_commands.by_cmd_args(cmd, args)
			return
		end

		if return_type == "table" then
			local args = utils.deepcopy(return_value)
			local cmd = table.remove(args, 1)

			run_commands.by_cmd_args(cmd, args)
			return
		end
	end
end

---Run a command with the given args
---@param cmd string
---@param args? string[]
function run_commands.by_cmd_args(cmd, args)
	args = args or {}
	job:new({
		command = cmd,
		args = args,
		on_stdout = function(error, data) -- could be used to make a custom terminal
			error = error or ""
			print(error .. " " .. data)
		end,
		on_stderr = function(error, data) -- could be used to make a custom terminal
			error = error or ""
			print(error .. " " .. data)
		end,
		on_exit = function(job, code) -- custom terminal use mayhaps
			print(job:result())
			print("exit code: " .. code)
		end,
	}):start()
end

---Run a command via it's name
---@param name string
function run_commands.by_name(name)
	if not run_commands.is_setup then
		return vim.notify(
			"You need to setup command-palette before running commands",
			vim.log.levels.ERROR,
			{ title = "command-palette" }
		)
	end

	for _, commandData in ipairs(run_commands.commands) do
		if commandData.name == name then
			run_commands.from_commmandData(commandData.cmd)
		end
	end
end

return run_commands
