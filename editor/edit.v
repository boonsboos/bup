module editor

import strings
import term
import term.ui

//import plugin

[heap]
pub struct Editor {
	version    string = '0.0.1'
mut:
	filename   string = 'no file opened'

	height     int
	width      int
	buf        strings.Builder = []u8{}
	ctx        &ui.Context = unsafe { nil } // only used for handling keys
}

pub fn start() {

	mut e := &Editor{}

	//e.plugin_reg.start_all()

	e.ctx = ui.init(
		user_data: e
		init_fn: fn [mut e] (_ voidptr) {
			e.draw()
		}
		event_fn: handle_event
		hide_cursor: true
	)

	e.ctx.run() or { exit(1) }

}

// [inline]
// pub fn (mut e Editor) register_plugin(name string, cb fn ()) {
// 	bup.plugin_reg.register_plugin(name, cb)
// }

fn handle_event(event &ui.Event, e voidptr) {
	term.clear()
	mut app := &Editor(e)
	app.draw()
}