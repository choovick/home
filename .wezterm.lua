local wezterm = require("wezterm")
local config = {}

-- font
config.font = wezterm.font("Hack Nerd Font Mono", {})
config.font_size = 16

-- dynamic color scheme switching
local function mode_overrides(appearance)
	if appearance:find("Dark") then
		return {
			color_scheme = "Gruvbox Material (Gogh)",
			-- background = "#1e1e1e",
		}
	else
		return {
			color_scheme = "catppuccin-latte",
			-- background = "#d1d1d1",
		}
	end
end
wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local overrides_appearance = mode_overrides(appearance)
	local scheme = overrides_appearance.color_scheme
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		-- overrides.colors = {
		-- 	background = overrides_appearance.background,
		-- }
		window:set_config_overrides(overrides)
	end
end)
--/ dynamic color scheme switching
config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = false
-- increase contrast

-- config.colors = {}

-- background blur
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

return config
