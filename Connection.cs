using Godot;
using System;
using System.IO.Ports;


public partial class Connection : Node2D
{
	SerialPort serialPort;

	RichTextLabel text;

	public override void _Ready()
	{
		text = GetNode<RichTextLabel>("RichTextLabel");
		serialPort = new SerialPort();
		serialPort.PortName = "COM3";
		serialPort.BaudRate = 9600;
		serialPort.Open();

	}

	public override void _Process(double delta)
	{
		if(!serialPort.IsOpen) return;

		string serialMessage = serialPort.ReadExisting();
	}
}
