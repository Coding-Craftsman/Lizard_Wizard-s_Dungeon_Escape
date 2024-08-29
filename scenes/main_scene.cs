using Godot;
using System;

public partial class main_scene : Node2D
{
	Node2D doorGroup;

	door leftDoor;

	door rightDoor;

	Player player;

	int potionShiftSpeed = 200;

	int potionShiftDistance = 570;

	int doorShiftDistance = 320;

	float finalShelfLocation;

	float finalDoorLocation;

	bool potionDrank = false;

	potions_shelf shelf;

	user_interface ui;

	Global_Values globalValues;

	// current room
	int currentRoom = 1;

	const int LAST_ROOM = 12;

	bool hasLooked = false;

	bool hasTouched = false;

	bool hasListened = false;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		globalValues = GetNode<Global_Values>("/root/GlobalValues");

		ui = GetNode<user_interface>("Camera2D/UserInterface");
		//ui.DisplayMessage(globalValues.DialogMessage["test"]);

		player = GetNode<Player>("/root/Player");

		shelf = GetNode<potions_shelf>("Potions_Shelf");
		
		finalShelfLocation = shelf.Position.Y + potionShiftDistance;		

		// determine which door is good and which door is bad
		// initially left door is bad, right is good
		// TODO Add logic
		leftDoor = GetNode<door>("DoorGroup/Door_Left");
		rightDoor = GetNode<door>("DoorGroup/Door_Right");
		doorGroup = GetNode<Node2D>("DoorGroup");
		// determine which door is bad
		RandomNumberGenerator rng = new RandomNumberGenerator();		

		var val = GD.Randi() % 2;

		if(val == 1)
		{
			leftDoor.ClearRoom = false;
			rightDoor.ClearRoom = true;
		}
		else
		{
			leftDoor.ClearRoom = true;
			rightDoor.ClearRoom = false;
		}
		

		finalDoorLocation = doorGroup.Position.Y + doorShiftDistance;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (potionDrank)
		{
			Vector2 vel = new Vector2(0, potionShiftSpeed);

			shelf.Translate(vel * (float)delta);

			if(doorGroup.Position.Y <= finalDoorLocation)
			{
				doorGroup.Translate(vel * (float)delta);
				//leftDoor.Translate(vel * (float)delta);
				//rightDoor.Translate(vel * (float)delta);
			}
			
			if(shelf.Position.Y >= finalShelfLocation)
			{
				potionDrank = false;
				GD.Print("Stopping potion movement");
			}
		}
	}

	public void _on_potions_shelf_potion_taken(potion takenPotion)
	{
		ui.DisplayMessage(globalValues.DialogMessage[takenPotion.DrinkDialogMessage]);
		
		player.ApplyPotion(takenPotion);

		potionDrank = true;
	}


	public void _on_user_interface_ui_listen()
	{
		if(hasListened)
		{
			ui.DisplayMessage("You don't hear anything else useful");
		}
		else
		{
			hasListened = true;
			
		}

		
	}

	public void _on_user_interface_ui_look()
	{
		if(hasLooked)
		{
			ui.DisplayMessage("You don't see anything else useful");
		}

		hasLooked = true;
	}

	public void _on_user_interface_ui_touch()
	{
		if(hasTouched)
		{
			ui.DisplayMessage("You don't feel anything else useful");
		}

		hasTouched = true;
	}

	private bool SkillCheck(int playerSkill, double difficulty)
	{
		RandomNumberGenerator rng = new RandomNumberGenerator();

		var percent = playerSkill / 100.0;

		var luck = rng.Randfn();

		if(percent - difficulty + luck >= .5)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
