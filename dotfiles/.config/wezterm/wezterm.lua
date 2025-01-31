-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

local mux = wezterm.mux

-- local status = require("status") -- custom status (tabs and info)

-- Font
config.font_size = 16

-- Window
--config.macos_window_background_blur = 50 -- blur
config.window_decorations = "RESIZE" -- removes title bar
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 120
config.initial_rows = 30

-- Tabs
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
-- config.tab_max_width = 30
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Theme
--config.color_scheme = "Dracula (Official)"
--config.color_scheme = "tokyonight"
--config.color_scheme = "tokyonight_moon"
--config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = 'tokyonight_moon'

config.keys = {
	-- Jump word to the left
	{
		key = 'LeftArrow',
		mods = 'OPT',
		action = wezterm.action.SendKey({ key = 'b', mods = 'ALT' }),
	},
	-- Jump word to the right
	{
		key = 'RightArrow',
		mods = 'OPT',
		action = wezterm.action.SendKey({ key = 'f', mods = 'ALT' }),
	},

	-- Go to beginning of line
	{
		key = 'LeftArrow',
		mods = 'CMD',
		action = wezterm.action.SendKey({
		key = 'a',
		mods = 'CTRL',
		}),
	},
	-- Go to end of line
	{
		key = 'RightArrow',
		mods = 'CMD',
		action = wezterm.action.SendKey({ key = 'e', mods = 'CTRL' }),
	}
}

-- auto maximize on startup
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
