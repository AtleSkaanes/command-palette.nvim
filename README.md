# command-palette.nvim
This is a a plugin for neovim inspired by VS code's command palette.
This plugin will enable you to create commands, and save them to the command palette for easy use.
This will not show all available nvim commands, only custom ones you have created and saved to the command palette!

This plugin uses nvim's builtin select function, so it is recommended to use [telescope](https://github.com/nvim-telescope/telescope.nvim) along with either [dressing](https://github.com/stevearc/dressing.nvim) or [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim), to get a GUI.

## WARNING!
THis plugin is currently non-functional, but is in active development!

## Installation

### Packer
```lua
use { 'AtleSkaanes/command-palette.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
}
```

### Lazy
```lua
return {
    'AtleSkaanes/command-palette.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
}
```

# Todo
- [ ] Add support for commands that take async input
- [ ] Add support for string based commands
- [ ] Add support for table of string based commands
- [ ] Add support for commands that output their command via a function (Must be synchronous)
- [ ] Run commands via ui
- [ ] Run commands via name
- [ ] Add more commands on the fly outside setup
