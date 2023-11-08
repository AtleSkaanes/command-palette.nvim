---@class CmdPalette: CommandPalette
local CmdPalette = {}

-- default args
---@type ConfigOpts
CmdPalette.opts = {
	commands = {},
	mappings = {
		["<leader>c1"] = "jhonny",
		["<leader>c2"] = 2,
	},
}

---@param opts ConfigOpts
function CmdPalette.setup(opts)
	for k, v in pairs(opts) do
		CmdPalette.opts[k] = v
	end
end

-- Function
function CmdPalette.ui() end

---Execute a specific command from opts
---@param idx integer
function CmdPalette.run_cmd_by_idx(idx) end

---Execute a specific command from opts
---@param name string
function CmdPalette.run_cmd_by_name(name) end

return CmdPalette
