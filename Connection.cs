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
		serialPort.PortName = "COM6";
		serialPort.BaudRate = 38400;
		serialPort.Open();
		
		serialPort2 = new SerialPort();
		serialPort2.PortName = "COM7";
		serialPort2.BaudRate = 38400;
		serialPort2.Open();
	}

	public override void _Process(double delta)
	{
		string serialMessage = serialPort.ReadExisting();
		text.Text = serialMessage;
		string b1 = @"\bB1\b";
		string b2 = @"\bB2\b";
		string b3 = @"\bB3\b";
		
		string Y0 = @"\bY:0";
		string Y1 = @"\bY:1";
		string Y2 = @"\bY:2";
		string Y3 = @"\bY:3";
		string Y4 = @"\bY:4";
		string Y5 = @"\bY:5";
		string Y6 = @"\bY:6";
		
		string X0 = @"\bX:0";
		string X1 = @"\bX:1";
		string X2 = @"\bX:2";
		string X3 = @"\bX:3";
		string X4 = @"\bX:4";
		string X5 = @"\bX:5";
		string X6 = @"\bX:6";

		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B1\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B2\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, b3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "B3\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X0, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "0", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y0, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "0", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "1", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "1", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "2", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "2", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "3", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "3", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X4, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "4", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y4, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "4", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X5, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "5", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y5, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "5", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, X6, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "6", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage, Y6, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg", "6", "Y");
		}
		
		string serialMessage2 = serialPort2.ReadExisting();
		text.Text = serialMessage2;
		
		string pb1 = @"\bB1\b";
		string pb2 = @"\bB2\b";
		string pb3 = @"\bB3\b";
		
		string pY0 = @"\bY:0";
		string pY1 = @"\bY:1";
		string pY2 = @"\bY:2";
		string pY3 = @"\bY:3";
		string pY4 = @"\bY:4";
		string pY5 = @"\bY:5";
		string pY6 = @"\bY:6";
		
		string pX0 = @"\bX:0";
		string pX1 = @"\bX:1";
		string pX2 = @"\bX:2";
		string pX3 = @"\bX:3";
		string pX4 = @"\bX:4";
		string pX5 = @"\bX:5";
		string pX6 = @"\bX:6";
		
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB1\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB2\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pb3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "pB3\n", "B");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX0, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "0", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY0, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "0", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "1", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY1, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "1", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "2", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY2, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "2", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "3", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY3, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "3", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX4, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "4", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY4, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "4", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX5, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "5", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY5, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "5", "Y");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pX6, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "6", "X");
		}
		if (System.Text.RegularExpressions.Regex.IsMatch(serialMessage2, pY6, System.Text.RegularExpressions.RegexOptions.IgnoreCase)){
			text.Call("msg2", "6", "Y");
		}
		
		if (text.Call("hit").ToString() == "HIT"){
			serialPort.Write(text.Call("getReturn").ToString());
			serialPort2.Write(text.Call("getReturn2").ToString());
		}
	}
}
