
public void setup()
{
	size(600, 600);
}
public void draw()
{
	fractal(100, 100, 50, PI / 3);
}
public void mouseDragged()//optional
{

}

public void fractal(int x, int y, double len, double angle)
{
	if(len <= 100)
	{
		line(x, y, x + (int)len, y);
		line(x, y, x + (float)(len * Math.cos(angle)), y + (float)(len * Math.sin(angle)));
	}
}