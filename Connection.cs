using Godot;
using System;
using System.IO.Ports;
using System.Diagnostics;

public partial class Connection : Node2D
{
	SerialPort serialPort;
	RichTextLabel text;
	int port = 0;

	public override void _Ready()
	{
		text = GetNode<RichTextLabel>("RichTextLabel");
		serialPort = new SerialPort();
		serialPort.PortName = "COM3";
		serialPort.BaudRate = 115200;
		serialPort.Open();
	}

	public override void _Process(double delta)
	{
		if(!serialPort.IsOpen) return;
		string serialMessage = serialPort.ReadExisting();
		text.Text = serialMessage;
		string pb1 = @"\bB1\b";
		string pb2 = @"\bB2\b";
		string pb3 = @"\bB3\b";
		string pY = @"\bY:";
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, pb1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "pB1\n");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, pb2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "pB2\n");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, pb3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "pB3\n");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, pY, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", Regex.Match(serialMessage, @"Y:(\d+)").Groups[1].Value);
		}
		
		
		if(port == 1){
			serialPort.Write("Colli"); //[energy, special]
		}
	}
}
