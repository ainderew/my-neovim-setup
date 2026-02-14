# Neovim Configuration

This is my personal Neovim/LazyVim configuration using Lua.

## Structure

- `lua/config/` - Core configuration
  - `options.lua` - Vim options and settings
  - `keymaps.lua` - Custom keybindings
  - `autocmds.lua` - Autocommands (including Claude Code integration)
  - `lazy.lua` - Lazy.nvim plugin manager setup
- `lua/plugins/` - Plugin specifications for lazy.nvim
- `init.lua` - Entry point that loads config

## Conventions

- Follow LazyVim conventions and override patterns
- Use lazy loading for plugins where appropriate
- Keep keymaps organized by feature/plugin
- Use descriptive keymap descriptions for which-key
- Prefer editing existing plugin configs over creating new ones
- Use absolute paths in Lua code, relative paths in comments/descriptions

## LazyVim Integration

This config extends LazyVim rather than replacing it. Plugin overrides should:
1. Use `optional = true` for LazyVim's default plugins
2. Extend `opts` tables rather than replacing them
3. Follow LazyVim's file structure conventions

## Claude Code Integration

Files are configured to auto-reload when changed externally:
- `autoread` enabled in options.lua
- Aggressive `checktime` triggers in autocmds.lua
- Fast `updatetime` for responsive detection
