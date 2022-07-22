module plugin

struct Plugin {
	name string
	cb   fn ()
mut:
	thr  thread
} 

pub struct PluginRegistry {
mut:
	plugins []Plugin
}

pub fn (mut p PluginRegistry) register_plugin(name string, cb fn ()) {
	p.plugins << Plugin{name: name, cb: cb}
}

pub fn (mut p PluginRegistry) start_all() {
	for mut i in p.plugins {
		i.thr = go i.cb() 
	}
}

fn (mut p PluginRegistry) dump_all() {
	for i in p.plugins {
		dump(i)
	}
}