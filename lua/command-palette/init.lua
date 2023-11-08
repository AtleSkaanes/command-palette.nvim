CmdPalette = {}

CmdPalette.has_categories = true

CmdPalette.cmdNames = {}
CmdPalette.cmdFuncs = {}

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
    local i = 1
    for _, v in pairs(CmdPalette.args.commands) do
        CmdPalette.cmdNames[i] = v.name
        CmdPalette.cmdFuncs[i] = v.cmd
        i = i + 1
    end
end

-- Function 
function CmdPalette.show()
end

-- Execute a specific command from opts
function CmdPalette.cmd(index)
    
end

return CmdPalette
