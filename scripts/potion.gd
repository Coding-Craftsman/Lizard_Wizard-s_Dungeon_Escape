extends Object

class_name Potion

@export var Potion_Name = ""
	
@export var Sense  = ""
	
@export var Intensity = 0
	
@export var Drink_Dialog_Message = ""

func _init(name, sense, intensity, drink_dialog_message):
	Potion_Name = name
	Sense = sense
	Intensity = intensity
	Drink_Dialog_Message = drink_dialog_message
		
