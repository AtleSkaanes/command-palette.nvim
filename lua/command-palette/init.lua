---@class CmdPalette: CommandPalette
local CmdPalette = {}

CmdPalette.run_cmd = nil

---Currently no default options
---@type ConfigOpts
CmdPalette.opts = {
	commands = nil,
	mappings = nil,
	icons = { category = nil, cmd = nil, back = nil },
}

---@param opts ConfigOpts
function CmdPalette.setup(opts)
	for key, value in pairs(opts) do
		CmdPalette.opts[key] = value -- Override default opts
	end

	if not CmdPalette.opts.commands or #CmdPalette.opts.commands == 0 then
		return vim.notify(
			"No commands given, the plugin whon't load",
			vim.log.levels.INFO,
			{ title = "command-palette.nvim" }
		)
	end

	CmdPalette.run_cmd = require("command-palette.run_commands")
	CmdPalette.run_cmd.is_setup = true
	CmdPalette.run_cmd.commands = CmdPalette.opts.commands
end

return CmdPalette
