using Godot;
using System;

public partial class door : Node2D
{

	public bool ClearRoom { get; set; }

	public double Difficulty { get; set; }

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_texture_button_button_up()
	{
		if(ClearRoom)
		{
			GD.Print("You have entered a clear room!");
		}
		else
		{
			GD.Print("Oh no!! You've entered a monster room and died!");
		}
		
	}
}
