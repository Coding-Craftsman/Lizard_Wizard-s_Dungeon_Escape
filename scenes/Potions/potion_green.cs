using Godot;
using System;

public partial class potion_green : Node2D
{
	Global_Values globalValues;

	private potion ThisPotion { get; set; } = new potion();

	[Signal]
	public delegate void PotionDrinkEventHandler(potion potionDrank);

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		globalValues = GetNode<Global_Values>("/root/GlobalValues");
		
		// create a random status effect
		ThisPotion = globalValues.AllPotions[0];
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_button_button_up()
	{
		//GD.Print("Button Pressed for potion: " + ThisPotion.PotionName);
		EmitSignal(SignalName.PotionDrink, ThisPotion);
	}
}
