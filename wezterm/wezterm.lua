local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Mocha'
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'CommitMonoNerdFont'
config.font_size = 12.0
config.enable_kitty_keyboard = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 40
config.initial_cols = 80
config.initial_rows = 30
config.enable_tab_bar = false
config.use_resize_increments = true
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.check_for_updates = false

return config
