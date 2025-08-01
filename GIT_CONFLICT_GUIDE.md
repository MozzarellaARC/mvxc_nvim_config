# Git Conflict Resolution Setup - Quick Reference

## Plugins Configured
1. **git-conflict.nvim** - Main conflict resolution plugin
2. **gitsigns.nvim** - Git status in sign column
3. **vim-fugitive** - Comprehensive git integration

## Git Conflict Resolution Keybindings

### Quick Resolution (Buffer-local when in conflict)
- `co` - Choose **ours** (current branch)
- `ct` - Choose **theirs** (incoming branch) 
- `cb` - Choose **both** changes
- `c0` - Choose **none** (delete conflict)
- `]x` - Jump to **next** conflict
- `[x` - Jump to **previous** conflict

### Leader Key Shortcuts (Global)
- `<leader>gco` - Choose ours (current branch)
- `<leader>gct` - Choose theirs (incoming branch)
- `<leader>gcb` - Choose both changes
- `<leader>gc0` - Choose none (delete conflict)
- `<leader>gcn` - Next conflict
- `<leader>gcp` - Previous conflict
- `<leader>gcl` - List conflicts in quickfix window
- `<leader>gcr` - Refresh conflict detection

### Fugitive Integration
- `<leader>gs` - Git status
- `<leader>gd` - Git diff split
- `<leader>gg` - Quick commit with message

## Workflow for Resolving Conflicts

1. **When conflicts occur**: Plugin will notify you automatically
2. **Navigate conflicts**: Use `]x` and `[x` to jump between conflicts
3. **Resolve each conflict**: Use `co`, `ct`, `cb`, or `c0` to choose resolution
4. **List all conflicts**: Use `<leader>gcl` to see all conflicts in quickfix
5. **Check status**: Use `<leader>gs` to see git status
6. **Commit resolution**: Use `<leader>gg` to commit your resolution

## Visual Indicators
- **Incoming changes** (theirs): Highlighted with DiffAdd
- **Current changes** (ours): Highlighted with DiffText
- **Git signs**: Show added/modified/deleted lines in sign column

## Commands Available
- `:GitConflictChooseOurs` - Choose our version
- `:GitConflictChooseTheirs` - Choose their version
- `:GitConflictChooseBoth` - Choose both versions
- `:GitConflictChooseNone` - Choose neither version
- `:GitConflictNextConflict` - Jump to next conflict
- `:GitConflictPrevConflict` - Jump to previous conflict
- `:GitConflictListQf` - List conflicts in quickfix

## Tips
- The plugin loads automatically when opening files with conflicts
- Conflicts are detected in real-time as you edit
- Use the quickfix list to get an overview of all conflicts
- Gitsigns provides additional context about file changes
- Fugitive gives you full git integration for advanced operations
