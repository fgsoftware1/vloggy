module vloggy

import vcolors
import time

pub enum LogLevel {
	debug
	info
	warn
	err
}

pub enum TimeStamp {
	none
	time
	date
	datetime
}

pub struct Logger {
pub:
	level     LogLevel
	timestamp TimeStamp = .none
}

pub fn (l Logger) log(msg string) {
	match l.level {
		.debug { l.debug(msg) }
		.info { l.info(msg) }
		.warn { l.warn(msg) }
		.err { l.err(msg) }
	}
}

pub fn (l Logger) debug(msg string) {
	if level(l.level) <= level(.debug) {
		println('${l.timestamp()}${vcolors.cyan}[DEBUG]${vcolors.reset} ${msg}')
	} else {
		error('Logger not in debug level!')
	}
}

pub fn (l Logger) info(msg string) {
	if level(l.level) <= level(.info) {
		println('${l.timestamp()}${vcolors.blue}[INFO]${vcolors.reset} ${msg}')
	} else {
		error('Logger not in info level!')
	}
}

pub fn (l Logger) warn(msg string) {
	if level(l.level) <= level(.warn) {
		println('${l.timestamp()}${vcolors.yellow}[WARN]${vcolors.reset} ${msg}')
	} else {
		error('Logger not under warn level!')
	}
}

pub fn (l Logger) err(msg string) {
	if level(l.level) <= level(.err) {
		println('${l.timestamp()}${vcolors.red}[ERR]${vcolors.reset} ${msg}')
	} else {
		error('Logger not under debug level!')
	}
}

fn (l Logger) timestamp() string {
	return match l.timestamp {
		.none { '' }
		.time { '[${time.now().hour.str()}:${time.now().minute.str()}] ' }
		.date { '[${time.now().year.str()}-${time.now().month.str()}-${time.now().day.str()}] ' }
		.datetime { '[${time.now().format()}] ' }
	}
}

fn level(l LogLevel) int {
	return match l {
		.debug { 0 }
		.info { 1 }
		.warn { 2 }
		.err { 3 }
	}
}
