using Godot;
using System;
using System.IO.Ports;
using System.Diagnostics;

public partial class Connection : Node2D
{
	SerialPort serialPort;
	SerialPort serialPort2;
	RichTextLabel text;
	int port = 0;

	public override void _Ready()
	{
		text = GetNode<RichTextLabel>("RichTextLabel");
		serialPort = new SerialPort();
		serialPort.PortName = "COM7";
		serialPort.BaudRate = 19200;
		serialPort.Open();
		
		serialPort2 = new SerialPort();
		serialPort2.PortName = "COM3";
		serialPort2.BaudRate = 19200;
		serialPort2.Open();
	}

	public override void _Process(double delta)
	{
		//if(!serialPort.IsOpen) return;
		string serialMessage = serialPort.ReadExisting();
		
		text.Text = serialMessage;
		string b1 = @"\bB1\b";
		string b2 = @"\bB2\b";
		string b3 = @"\bB3\b";
		string X = @"\bX:";
		string Y = @"\bY:";
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B1\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B2\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B3\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", System.Text.RegularExpressions.Regex.Match(serialMessage, @"X:(\d+)").Groups[1].Value, "X");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", System.Text.RegularExpressions.Regex.Match(serialMessage, @"Y:(\d+)").Groups[1].Value, "Y");
		}
		serialPort.Write(text.Call("getReturn").ToString());
		
		string serialMessage2 = serialPort2.ReadExisting();
		text.Text = serialMessage2;
		string pb1 = @"\bB1\b";
		string pb2 = @"\bB2\b";
		string pb3 = @"\bB3\b";
		string pX = @"\bX:";
		string pY = @"\bY:";
		
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB1\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB2\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB3\n", "B");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", System.Text.RegularExpressions.Regex.Match(serialMessage, @"X:(\d+)").Groups[1].Value, "X");
		}
		else if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", System.Text.RegularExpressions.Regex.Match(serialMessage, @"Y:(\d+)").Groups[1].Value, "Y");
		}
		serialPort2.Write(text.Call("getReturn2").ToString()); //energy:special
	}
}
