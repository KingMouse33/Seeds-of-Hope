using Godot;
using System;

public class Plant : GodotObject
{
	protected sbyte daysLeft;
	protected sbyte baseResistance;
	protected double quality;
	protected double resistance;
	protected double speed;
	protected sbyte ND, PD, KD;
	protected sbyte NI, PI, KI;
	protected double yeild;

	public Plant(sbyte dl, sbyte br, double q, double r, double s, sbyte nd, sbyte pd, sbyte kd, sbyte ni, sbyte pi, sbyte ki, double y)
	{
		if (dl <= 0)
		{
			dl = 1;

		}
		if (br <= 0)
		{
			br = 1;
		}
		if ((q <= 0) || (q >= 1))
		{
			q = 0.5;
		}
		if ((r <= 0) || (r >= 1))
		{
			r = 0.5;
		}
		if ((s <= 0) || (s >= 1))
		{
			s = 0.5;
		}
		if (y <= 0)
		{
			y = 1;
		}
		daysLeft = dl;
		baseResistance = br;
		quality = q;
		resistance = r;
		speed = s;
		ND = nd;
		PD = pd;
		KD = kd;
		NI = ni;
		PI = pi;
		KI = ki;
		yield = y;
	}

	public void DayProg(int month, bool water)
	{
		if (water)
		{
			daysLeft--;
		}
	}

	public int Harvest(int plantNum)
	{
		int r = 0;
		var rand = new Random();
		for (int i = 0; i < plantNum * 10; i++) { 
			if (rand.Next(1,101) < (yeild * 10))
			{
				r++;
			}
		}
		return r;
	}

}
public class Tilled : Plant
{
	public Tilled(sbyte dl, sbyte br, double q, double r, double s, sbyte nd, sbyte pd, sbyte kd, sbyte ni, sbyte pi, sbyte ki, double y) : base(dl,q,r,s,nd,pd,kd,ni,pi,ki,y){
	}
}

public class Tuber : Tilled
{
	public Tuber(sbyte dl, sbyte br, double q, double r, double s, sbyte nd, sbyte pd, sbyte kd, sbyte ni, sbyte pi, sbyte ki, double y) : base(dl, br, q, r, s, nd, pd, kd, ni, pi, ki, y)
	{

	}
}

public class Potato : Tuber
{
	int color;
	public Potato(double q, double r, double s, int c) : base((12 + 5 * s), 80, q, r, s, 20, 6, 30, 30, 9, 45, 2.3)
	{
		color = c;
	}
}
