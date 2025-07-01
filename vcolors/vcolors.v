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

const colors = [red, green, yellow, blue, cyan, white]

pub fn print_random_color(text string) {
	random_color := colors[rand.intn(colors.len) or { 0 }]
	print('${random_color}${text}${reset}')
}
