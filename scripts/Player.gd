extends Node

@export var Consumed_Potions = []

@export var Sight = 100

@export var Touch = 100

@export var Hearing = 100

func _init():
	Sight = 100
	Touch = 100
	Hearing = 100

func Apply_Potion(new_potion : Potion):
	Consumed_Potions.append(new_potion)
	
	var s = new_potion.Sense.to_lower() # new_potion.Sense.lower()
	
	if s == "sight":
		Sight += new_potion.Intensity
	elif s == "touch":
		Touch += new_potion.Intensity
	elif s == "hearing":
		Hearing += new_potion.Intensity
		
		
