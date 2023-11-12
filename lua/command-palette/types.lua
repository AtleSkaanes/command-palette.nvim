---@meta

---@alias command
---| string # Single command to execute
---| string[] # Table of strings with command and flags
---| fun():string|string[] # Function if the command is not static

---@class CommandData
---@field name string
---@field category? string
---@field cmd command

---@class IconOpts
---@field cmd? string
---@field category? string
---@field back? string

---@class ConfigOpts
---@field commands? CommandData[]
---@field mappings? { [string]: string|integer }
---@field icons? IconOpts }

---@class CommandPalette
---@field opts ConfigOpts the configs set in setup
---@field defaults ConfigOpts the default configs
---@field commands CommandData[] all of the commands set by the user
---@field setup fun(opts: ConfigOpts) The setup function called by the user
---@field run_cmd CommandAPI The class responsible for calling commands
