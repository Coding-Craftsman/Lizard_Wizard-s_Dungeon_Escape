extends Node2D

signal Potion_Drink(potion)

const potion = preload("res://scripts/potion.gd")

var this_potion

# Called when the node enters the scene tree for the first time.
func _ready():
	this_potion = Globals.All_Potions[2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_button_button_up():
	Potion_Drink.emit(this_potion)
