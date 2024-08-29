extends Control

signal ui_touch
signal ui_listen
signal ui_look

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func Display_Message(message):
	$MessageBox.text = message
	get_node("MessageBoxTimer").start()
	
func Clear_Message():
	$MessageBox.text = ""

func _on_message_box_timer_timeout():
	Clear_Message()

func _on_look_button_up():
	ui_look.emit()

func _on_touch_button_up():
	ui_touch.emit()

func _on_hear_button_up():
	ui_listen.emit()
