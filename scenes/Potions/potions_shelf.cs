using Godot;
using System;

public partial class potions_shelf : Node2D
{
	[Signal]
	public delegate void PotionTakenEventHandler(potion takenPotion);

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_potion_green_potion_drink(potion takenPotion)
	{
		EmitSignal(SignalName.PotionTaken, takenPotion);
	}

	public void _on_potion_red_potion_drink(potion takenPotion)
	{
		EmitSignal(SignalName.PotionTaken, takenPotion);
	}

	public void _on_potion_yellow_potion_drink(potion takenPotion)
	{
		EmitSignal(SignalName.PotionTaken, takenPotion);
	}
}
