---@meta

---@alias command
---| string # Single command to execute
---| string[] # Table of strings with command and flags
---| fun():string|string[] # Function if the command is not static

---@class CommandData
---@field name string
---@field category? string
---@field cmd command

---@class ConfigOpts
---@field commands? CommandData[]
---@field mappings? { [string]: string|integer }

---@class CommandPalette
---@field opts ConfigOpts
---@field commands CommandData[]
---@field setup fun(opts: ConfigOpts)
---@field run_cmd_by_name fun(name: string)
---@field run_cmd_by_idx fun(idx: integer)
---@field ui fun()
