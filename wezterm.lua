-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Molokai'-- (Gogh)'
config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}


-- config.window_background_image = '/Users/sfo/Pictures/macOS-15-Purple-icons-wallpaper.png'
-- config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
--  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
--  hue = 1.0,

  -- You can adjust the saturation also.
--  saturation = 1.0,
-- }
-- config.window_background_opacity = 0.9
config.window_background_opacity = 0.6

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Fira Code' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 11.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.font = wezterm.font_with_fallback {
  {
    family = 'FiraCode Nerd Font',
    harfbuzz_features = {"zero" , "ss01", "ss07", "ss09", "ss10", "cv01", "cv02", "cv05", "cv09", "cv24", "cv25", "cv26", "cv29", "cv30", "cv31", "cv32" },
  },
  { family = 'Terminus' },
  'Noto Color Emoji',
}

-- and finally, return the configuration to wezterm
return config
