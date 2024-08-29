extends Node

const potion = preload("res://scripts/potion.gd")

var current_room = 1
const LAST_ROOM = 12

var All_Potions = []

var Dialog_Messages = {
	"potions.test_potion_1": "As you drink the potion you notice that the room appears to get a little darker",
	"potions.test_potion_2": "Your fingers begin to tingle a little as soon as the potion touches your lips",
	"potions.test_potion_3": "You ears start to ring",
	"potions.x_ray_vision": "Everything is becomming so clear!  Can you see your bones through your skin?"
}	

var Room_Difficulty = {
	1: .3,
	2: .3,
	3: .3,
	4: .4,
	5: .4,
	6: .4,
	7: .5,
	8: .5,
	9: .5,
	10: .6,
	11: .6,
	12: .7
}

var SoundEffects = true

func _ready():
	randomize()
	All_Potions.append(Potion.new("Ray Blocker", "Sight", -12, "potions.test_potion_1"))
	All_Potions.append(Potion.new("'Asprin'", "Touch", 5, "potions.test_potion_2"))
	All_Potions.append(Potion.new("Potion of Deafness", "Hearing", -20, "potions.test_potion_3"))
	All_Potions.append(Potion.new("X Ray Vision", "Sight", 50, "potions.x_ray_vision"))

func New_Game():
	current_room = 1
	
func check_win_condition():
	if current_room == LAST_ROOM:
		return true
	else:
		return false
