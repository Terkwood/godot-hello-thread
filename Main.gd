extends Control

signal load_completed

var thread

func _ready():
	thread = Thread.new()
	thread.start(self, "_background_load", 5)

func _background_load(num_seconds):
	connect("load_completed", get_node(self.get_path()), "_on_load_completed")
	OS.delay_msec(num_seconds * 1000)
	emit_signal("load_completed")

func _on_load_completed():
	print("oh hey")

func _exit_tree():
	thread.wait_to_finish()
