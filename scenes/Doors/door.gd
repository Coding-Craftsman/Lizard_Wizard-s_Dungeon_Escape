extends Node2D

var Clear_Room : bool = true

var Difficulty = 0.1

signal Door_Clicked(is_clear_room)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_texture_button_button_up():
	Door_Clicked.emit(Clear_Room)
	#if(Clear_Room):
	#	print("You have entered a clear room!")
	#else:
	#	print("Oh no!  You've entered a monster room and died!")
