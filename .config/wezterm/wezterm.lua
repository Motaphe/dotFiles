local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors
config.colors = {
	foreground = "#c9c7cd",
	background = "#161617",

	cursor_bg = "#757581",
	cursor_fg = "#c9c7cd",
	cursor_border = "#757581",

	ansi = {
		"#27272a", -- black
		"#f5a191", -- red
		"#90b99f", -- green
		"#e6b99d", -- yellow
		"#aca1cf", -- blue
		"#e29eca", -- magenta
		"#ea83a5", -- cyan
		"#c1c0d4", -- white
	},
	brights = {
		"#353539", -- bright black
		"#ffae9f", -- bright red
		"#9dc6ac", -- bright green
		"#f0c5a9", -- bright yellow
		"#b9aeda", -- bright blue
		"#ecaad6", -- bright magenta
		"#f591b2", -- bright cyan
		"#cac9dd", -- bright white
	},
}

-- Font settings
config.font = wezterm.font("Fira Code", { weight = "Regular", italic = false })
config.font_size = 18.0

-- Enable bold and italic styles
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("Fira Code", { weight = "Bold" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("Fira Code", { weight = "Bold", italic = true }),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font("Fira Code", { italic = true }),
	},
}

-- Window appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.94
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}
config.initial_rows = 33
config.initial_cols = 90
config.window_close_confirmation = "NeverPrompt"

-- Miscellaneos
config.max_fps = 140
config.prefer_egl = true

return config
