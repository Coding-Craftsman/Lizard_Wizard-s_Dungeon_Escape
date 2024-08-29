extends Node2D

var door_group
var left_door
var right_door
var potion_shift_speed = 200
var potion_shift_distance = 570
var door_shift_distance = 320
var final_shelf_location
var final_door_location
var potion_drank = false
var shelf
var ui
var has_looked = false
var has_touched = false
var has_listened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ui = get_node("Camera2D/UserInterface")
	shelf = get_node("Potions_Shelf")
	door_group = get_node("DoorGroup")
	left_door = get_node("DoorGroup/Door_Left")
	right_door = get_node("DoorGroup/Door_Right")
	
	final_shelf_location = shelf.position.y + potion_shift_distance
	
	var val = randi() % 2
	
	print("door value " + str(val))
	
	if val == 1:
		left_door.Clear_Room = false
		right_door.Clear_Room = true
	else:
		left_door.Clear_Room = true
		right_door.Clear_Room = false
	
	final_door_location = door_group.position.y + door_shift_distance
	
	print(Globals.current_room)
	
	# setup potions
	# pick 3 different random potions and set each potion
	
	
	if Globals.SoundEffects:
		$SoundEffects/MonsterSounds.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if potion_drank and shelf.position.y < final_shelf_location:
		var vel = Vector2(0, potion_shift_speed)
		
		shelf.translate(vel * delta)
		
		if door_group.position.y <= final_door_location:
			door_group.translate(vel * delta)
		
		#if shelf.position.y >= final_shelf_location:
			#potion_drank = false			
		

func _on_potions_shelf_potion_taken(potion):
	if Globals.SoundEffects:
		$SoundEffects/DrinkPotion.play()
	
	ui.Display_Message(Globals.Dialog_Messages[potion.Drink_Dialog_Message])
	
	Player.Apply_Potion(potion)
	
	potion_drank = true

func _on_user_interface_ui_listen():
	if has_listened:
		ui.Display_Message("You don't hear anything else useful")
	else:
		var result = Skill_Check(Player.Hearing, Globals.Room_Difficulty[Globals.current_room])	
		
		if result:			
			ui.Display_Message("You hear faint shuffling sounds by the " + str(which_door()) + " door")
		else:
			ui.Display_Message("Both doors are very solid and you can't hear anything")
		
	has_listened = true

func _on_user_interface_ui_look():
	if has_looked:
		ui.Display_Message("You don't see anything else useful")
	else:
		var result = Skill_Check(Player.Sight, Globals.Room_Difficulty[Globals.current_room])	
		
		if result:
			ui.Display_Message("You see shadows moving under the " + str(which_door()) + " door")
		else:
			ui.Display_Message("Yep, you see doors")
		
	has_looked = true

func _on_user_interface_ui_touch():
	if has_touched:
		ui.Display_Message("You don't feel anything else useful")
	else:
		var result = Skill_Check(Player.Hearing, Globals.Room_Difficulty[Globals.current_room])	
		
		print("result: " + str(result))
		
		if result:
			ui.Display_Message("You feel something scratching at the " + str(which_door()) + " door")
		else:
			ui.Display_Message("Wow! These doors have been made from some nice smooth wood!")
	
	has_touched = true
	
func Skill_Check(player_skill, difficulty):
	#var random = RandomNumberGenerator.new()
	var percent = player_skill / 100.0
	#var luck = random.randfn()
	
	if percent - difficulty >= 0.5:
		return true
	else:
		return false

func _on_door_left_door_clicked(is_clear_room):
	# if the door is clear, increment the current room number and restart the scene
	if is_clear_room:
		if Globals.check_win_condition():
			game_win()
		else:
			next_room()
	else:
		# end the game and display the game over scene
		game_over()

func _on_door_right_door_clicked(is_clear_room):
	# if the door is clear, increment the current room number and restart the scene
	if is_clear_room:
		if Globals.check_win_condition():
			game_win()
		else:
			next_room()
	else:
		# end the game and display the game over scene
		game_over()

func which_door():
	print("which_door, left door:" + str(left_door.Clear_Room))
	if left_door.Clear_Room:
		print("left door clear")
		return "right"
	else:
		print("right door clear")
		return "left"


func _on_monster_sounds_finished():
	$SoundEffects/ReplayDelay.start()
	#pass # Replace with function body.


func _on_replay_delay_timeout():
	$SoundEffects/MonsterSounds.play()
	#pass # Replace with function body.

func next_room():
	Globals.current_room += 1
	get_tree().reload_current_scene()

func game_win():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/ui/win.tscn")

func game_over():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/ui/game_over.tscn")
