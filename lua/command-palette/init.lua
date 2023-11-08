CmdPalette = {}

CmdPalette.commands = {}

-- default args
CmdPalette.args = {

    commands = {},
}

-- get config opts
function CmdPalette.setup(opts)
    for k, v in pairs(opts) do
        CmdPalette.args[k] = v
    end

    CmdPalette.commands = CmdPalette.args.commands

    print(#CmdPalette.commands)
end

-- Function 
function CmdPalette.show()
    local names = {}
    HasCategories = true
    if #CmdPalette.commands <= 1 and CmdPalette.commands[1].name == nil then
        HasCategories = false
    end

end

-- Execute a specific command from opts
function CmdPalette.cmd(index)
    
end

return CmdPalette
