module vcolors

import rand

pub const reset = '\x1b[0m'
pub const bold = '\x1b[1m'
pub const red = '\x1b[31m'
pub const green = '\x1b[32m'
pub const yellow = '\x1b[33m'
pub const blue = '\x1b[34m'
pub const cyan = '\x1b[36m'
pub const white = '\x1b[37m'

pub fn random_color(text string) string {
	color_codes := [red, blue, green, yellow, cyan, white]
	random_color_code := color_codes[rand.intn(color_codes.len) or { 0 }]
	return random_color_code + text + reset
}
