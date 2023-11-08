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

    if #CmdPalette.commands <= 1 and CmdPalette.args.commands[1].name == nil then
        CmdPalette.has_categories = false
    end

    CmdPalette.commands = CmdPalette.args.commands

    print(#CmdPalette.commands)
end

-- Function 
function CmdPalette.show()
    local names = {}
    -- if CmdPalette.has_categories then print(categories)
    -- else print(commands)
    -- end
end

-- Execute a specific command from opts
function CmdPalette.cmd(index)
    
end

return CmdPalette
