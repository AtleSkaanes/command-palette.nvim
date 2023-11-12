# command-palette.nvim
This is a a plugin for neovim inspired by VS code's command palette, but made in neovim fassion.
This plugin will enable you to create commands, and save them to the command palette for easy use.
This will not show all available nvim commands, only custom ones you have created and saved to the command palette!

This plugin uses nvim's builtin select function, so it is recommended to use [telescope](https://github.com/nvim-telescope/telescope.nvim)
along with either [dressing](https://github.com/stevearc/dressing.nvim) or [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim), to get a GUI.

## Installation

### Packer
```lua
use { 'AtleSkaanes/command-palette.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = "*",
    config = function()
        local cmd_palette = require('command-palette')
        cmd_palette.setup({
            commands = {
                -- commands here
            },
        })
    end,
}
```

### Lazy
```lua
return {
    'AtleSkaanes/command-palette.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = "*",
    opts = { -- theese opts go into command-palette.setup()
        commands = {
            -- commands here
        },
    },
}
```

## Setup

### config
```lua
local cmd_palette = require('command-palette')

    -- If you use lazy you can put the arguments into 'opts' instead
cmd_palette.setup({ 
    commands = {                -- Theese are just some very simple examples
        {                       -- each command is it's own table
            name = 'compile main', -- descriptive name
            category = 'cpp',   -- a category to organise your commands (not necesarry)
            cmd = 'clang main.cpp -o main.exe', -- the command to run
        },
        {
            name = 'Run',
            category = 'Rust',
            cmd = {
                'cargo',        -- cmd can be of type table as well.
                'run',          -- All strings will be sepereated by spaces
            },
        },
        {
            name = 'run python script',
            cmd = function()    -- Also accepts function to aquire input (MUST BE SYNCHRONOUS)
                local command = 'python'
                local script = vim.fn.input('Python Script name: ') -- vim.ui.input is async so it doesn't work

                return { command, script } -- output can be a string or table of strings
            end,
            
        },
    },

    -- default config
    icons = {
        category = 'F',
        cmd = 'C',
        back = '..'
    },  
})
-- Example keymappings

    -- Run a specific command, currently can't specify category (fix comming)
vim.keymap.set('n', '<leader>c1', function() cmd_palette.run_cmd.by_name('compile main') end)
    -- Open the ui in a specific category
vim.keymap.set('n', '<leader>cR', function() cmd_palette.run_cmd.ui('Rust') end)
    -- Open the ui at the root category (same as cmd_palette.run_cmd.ui('root'))
vim.keymap.set('n', '<leader>C', cmd_palette.run_cmd.ui)
```

# Todo
- [x] String based commands
- [x] Table of strings based commands
- [x] Function based commands (synchronous)
- [ ] Async functions to be passed as parameters (for example use of vim.ui functions in input)
- [x] Run commands via ui
- [x] Run commands via name
- [ ] Add more commands on the fly outside setup
- [ ] Custom CWD for commands
- [ ] Custom ENV for commands
- [ ] Run commands with output shown in a seperate buffer
- [ ] Change output buffer position
- [ ] Run commands in a terminal
- [ ] Change terminal position
