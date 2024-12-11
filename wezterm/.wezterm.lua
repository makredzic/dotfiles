local wezterm = require 'wezterm'
local config = {}

-- Primary source for config: https://hackernoon.com/get-the-most-out-of-your-terminal-a-comprehensive-guide-to-wezterm-configuration

local mux = wezterm.mux
--wezterm.on("gui-startup", function(cmd)
    --local tab, pane, window = mux.spawn_window(cmd or {})
    --window:gui_window():maximize()
--end)

local act = wezterm.action

config.keys = {}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14
config.line_height = 1.1

config.color_scheme = 'Catppuccin Mocha'
config.initial_rows = 42
config.initial_cols = 215

config.window_decorations = "RESIZE"

-- Set font for tabs only
config.window_frame = {
	font = wezterm.font { family = 'Noto Sans', weight = 'Regular'}
}
config.hide_tab_bar_if_only_one_tab = true


-- Hotkeys
config.disable_default_key_bindings = true
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 2000 } 
config.keys = {
	{ key = 'F11', mods = 'NONE', action = wezterm.action.ToggleFullScreen },
	{ key = 'Enter', mods = 'CTRL', action = act.ActivateCopyMode },
	{ key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
	{ key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
	{ key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
	{ key = '0', mods = 'CTRL', action = act.ResetFontSize },
	{ key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
	{ key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
	{ key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
	{ key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
	{ key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
	{ key = 'h', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
	{ key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
	{ key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
	{ key = 's', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
	{ key = 'v', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
	{ key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
	{ key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
	{ key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
	{ key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
	{ key = 'h', mods = 'CTRL|ALT', action = act.ActivatePaneDirection 'Left', },
	{ key = 'l', mods = 'CTRL|ALT', action = act.ActivatePaneDirection 'Right', },
	{ key = 'j', mods = 'CTRL|ALT', action = act.ActivatePaneDirection 'Down', },
	{ key = 'k', mods = 'CTRL|ALT', action = act.ActivatePaneDirection 'Up', },
	{ key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = false } },
	{ key = 'x', mods = 'CTRL', action = act.CloseCurrentPane{ confirm = false } },
	{ key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02', },
	{ key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode, },
	{ key = 'p', mods = 'LEADER', action = act.PasteFrom 'PrimarySelection', },
    { key = 'k', mods = 'CTRL|ALT|SHIFT', action = act{ScrollByLine=-1}},
    { key = 'j', mods = 'CTRL|ALT|SHIFT', action = act{ScrollByLine=1}},
	{ key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, }
}



return config
