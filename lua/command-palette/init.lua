local run_cmd = require("command-palette.run_commands")

---@class CmdPalette: CommandPalette
local CmdPalette = {}

---Currently no default options
---@type ConfigOpts
CmdPalette.opts = {
	commands = nil,
	mappings = nil,
}

---@param opts ConfigOpts
function CmdPalette.setup(opts)
	for key, value in pairs(opts) do
		CmdPalette.opts[key] = value -- Override default opts
	end

	if CmdPalette.opts.commands == nil or #CmdPalette.opts.commands == 0 then
		return vim.notify(
			"No commands given, the plugin whon't load",
			vim.log.levels.INFO,
			{ title = "command-palette.nvim" }
		)
	end

	CmdPalette.commands = CmdPalette.opts.commands
end

---Open ui for all commands
CmdPalette.ui = run_cmd.ui

---Execute a specific command from opts
CmdPalette.run_cmd_by_name = run_cmd.by_name

return CmdPalette
