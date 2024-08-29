extends Node2D

signal Potion_Taken(potion)

var red_potion

var green_potion

var yellow_potion

# Called when the node enters the scene tree for the first time.
#func _ready():	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# need to export?
func set_red_potion(potion):
	red_potion = potion
	$PotionRed.this_potion = potion
	
func set_green_potion(potion):
	green_potion = potion
	$PotionGreen.this_potion = potion

func set_yellow_potion(potion):
	yellow_potion = potion
	$PotionYellow.this_potion = potion

func _on_potion_green_potion_drink(potion):
	Potion_Taken.emit(potion)


func _on_potion_red_potion_drink(potion):
	Potion_Taken.emit(potion)


func _on_potion_yellow_potion_drink(potion):
	Potion_Taken.emit(potion)
