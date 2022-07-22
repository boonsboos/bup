module editor

import strings
import term

fn (mut e Editor) draw() {
	e.width, e.height = term.get_terminal_size()

	e.ctx.set_cursor_position(0, 0)
	e.ctx.hide_cursor()
	e.buf.writeln(write_top_bar(mut e))

	print(e.buf)
	e.buf.clear()
}

[inline]
fn write_top_bar(mut e Editor) string { 
	return term.bg_white(
		term.black(' bup v$e.version | $e.filename') 
		+ strings.repeat_string(' ', e.width - 13 - e.filename.len)
	) + term.reset('')
}