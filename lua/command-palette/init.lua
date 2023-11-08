CmdPalette = {}

CmdPalette.has_categories = true

-- default args
CmdPalette.args = {
    commands = {},
}

-- get config opts
function CmdPalette.setup(opts)
    for k, v in pairs(opts) do
        CmdPalette.args[k] = v
    end
    if #CmdPalette.args.commands <= 1 and CmdPalette.args.commands[1].name == nil then
        CmdPalette.has_categories = false
    end
end

-- Function 
function CmdPalette.show()
    
end

-- Execute a specific command from opts
function CmdPalette.cmd(index)
    
end

return CmdPalette
