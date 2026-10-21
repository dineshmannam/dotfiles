local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Look
config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- Fade a window that does not have focus.
local faded_opacity = 0.62
local faded_text = { hue = 1.0, saturation = 0.25, brightness = 0.45 }

wezterm.on("window-focus-changed", function(window)
	local overrides = window:get_config_overrides() or {}
	local should_fade = not window:is_focused()
	local is_faded = overrides.window_background_opacity == faded_opacity

	-- Each override write reloads the config, so write only on a change.
	if should_fade == is_faded then
		return
	end

	if should_fade then
		overrides.window_background_opacity = faded_opacity
		overrides.foreground_text_hsb = faded_text
	else
		overrides.window_background_opacity = nil
		overrides.foreground_text_hsb = nil
	end
	window:set_config_overrides(overrides)
end)

return config
