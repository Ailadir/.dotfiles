local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0,
}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font_size = 16
config.font = wezterm.font("JetBrains Mono Regular", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font_rules = {
	{
		italic = true,
		font = wezterm.font("JetBrains Mono Italic"),
		intensity = "Normal",
	},
	{
		italic = true,
		font = wezterm.font("JetBrains Mono Bold Italic"),
		intensity = "Bold",
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
	},
}
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.term = "xterm-256color"
config.default_cursor_style = "SteadyBar"

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.scrollback_lines = 200000
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98

config.xcursor_theme = "Catppuccin-Mocha-Maroon-Cursors"
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true

-- config.tab_bar_at_bottom = true
config.automatically_reload_config = true
-- config.default_prog = { "/opt/homebrew/bin/zellij", "-l", "welcome" }

-- config.unix_domains = { {
-- 	name = "unix",
-- } }
-- config.default_gui_startup_args = { "connect", "unix" }
--
-- config.leader = {
-- 	key = "a",
-- 	mods = "CTRL",
-- 	timeout_milliseconds = 2000,
-- }
-- config.keys = {
-- 	-- Show tab navigator; similar to listing panes in tmux
-- 	{
-- 		key = "w",
-- 		mods = "LEADER",
-- 		action = act.ShowTabNavigator,
-- 	}, -- Create a tab (alternative to Ctrl-Shift-Tab)
-- 	{
-- 		key = "c",
-- 		mods = "LEADER",
-- 		action = act.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	-- Close tab
-- 	{
-- 		key = "x",
-- 		mods = "LEADER",
-- 		action = act.CloseCurrentTab({ confirm = true }),
-- 	},
-- 	-- Rename current tab; analagous to command in tmux
-- 	{
-- 		key = ",",
-- 		mods = "LEADER",
-- 		action = act.PromptInputLine({
-- 			description = "Enter new name for tab",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line then
-- 					window:active_tab():set_title(line)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	-- Move to next/previous TAB
-- 	{
-- 		key = "n",
-- 		mods = "LEADER",
-- 		action = act.ActivateTabRelative(1),
-- 	},
-- 	{
-- 		key = "p",
-- 		mods = "LEADER",
-- 		action = act.ActivateTabRelative(-1),
-- 	},
-- 	-- Attach to muxer
-- 	{
-- 		key = "a",
-- 		mods = "LEADER",
-- 		action = act.AttachDomain("unix"),
-- 	},
-- 	-- Detach from muxer
-- 	{
-- 		key = "d",
-- 		mods = "LEADER",
-- 		action = act.DetachDomain({ DomainName = "unix" }),
-- 	},
-- 	{
-- 		key = "s",
-- 		mods = "LEADER",
-- 		action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
-- 	},
-- 	-- Rename current session; analagous to command in tmux
-- 	{
-- 		key = ".",
-- 		mods = "LEADER",
-- 		action = act.PromptInputLine({
-- 			description = "Enter new name for session",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line then
-- 					mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
-- 					-- )
-- 					-- mux.rename_workspace(window:mux_window():get_workspace(), line)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	-- Session manager bindings
-- 	{
-- 		key = "s",
-- 		mods = "LEADER|SHIFT",
-- 		action = act({ EmitEvent = "save_session" }),
-- 	},
-- 	{
-- 		key = "L",
-- 		mods = "LEADER|SHIFT",
-- 		action = act({ EmitEvent = "load_session" }),
-- 	},
-- 	{
-- 		key = "R",
-- 		mods = "LEADER|SHIFT",
-- 		action = act({ EmitEvent = "restore_session" }),
-- 	},
-- }

return config
