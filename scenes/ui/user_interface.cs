using Godot;
using System;

public partial class user_interface : Control
{
	TextEdit messageBox;

	[Signal]
	public delegate void UiTouchEventHandler();

	[Signal]
	public delegate void UiListenEventHandler();

	[Signal]
	public delegate void UiLookEventHandler();

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		messageBox = GetNode<TextEdit>("MessageBox");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void DisplayMessage(string Message)
	{
		messageBox.Text = Message;
		GetNode<Timer>("MessageBoxTimer").Start();
	}

	public void ClearMessage()
	{
		messageBox.Text = "";
	}

	public void _on_message_box_timer_timeout()
	{
		ClearMessage();
	}

	public void _on_touch_button_up()
	{
		GD.Print("Touch button pressed");
		EmitSignal(SignalName.UiTouch);
	}

	public void _on_hear_button_up()
	{
		GD.Print("hear button pressed");
		EmitSignal(SignalName.UiListen);
	}

	public void _on_look_button_up()
	{
		GD.Print("Look button pressed");
		EmitSignal(SignalName.UiLook);
	}
}
