extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_restart_button_button_up():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main_scene.tscn")


func _on_credits_button_up():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/ui/credits.tscn")
