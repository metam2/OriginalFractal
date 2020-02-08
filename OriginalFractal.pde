//x and y are the coords of the top vertex of the triangle
float len, x, y;
int lim;
public void setup()
{
	size(500, 500);
	len = 120;
	lim = width / 40;
	x = 250;
	y = 50;
}
public void draw()
{
	noStroke();
	fill(200);
	rect(0, 0, width, height);
	stroke(0);
	float triangleHeight = (float)(3 * len * Math.sin(PI / 3));
	fractal(x, y, len, 2 * PI / 3);
	fractal(x + len * 1.5, y + triangleHeight, len, -2 * PI / 3);
	fractal(x - len * 1.5, y + triangleHeight, len, 0);
}

public void keyPressed()
{
	if(key == 'a')
	{
		if(lim <= width / 40)
		{
			len += 10;
			x += 1;
			y -= 1;
		}
		else
		{
			lim /= 1.5;
		}
	}
	if(key == 's')
	{
		if(len > 100)
		{
			len -= 10;
			x -= 1;
			y += 1;
		}
		else
		{
			if(lim < 100)
			lim *= 1.5;
		}
	}
}

public void fractal(float x, float y, float len, double angle)
{
	float p1x = x;
	float p1y = y;
	float p2x = p1x + (float)(len * Math.cos(angle));
	float p2y = p1y + (float)(len * Math.sin(angle));
	float p3x = p2x + (float)(len * Math.cos(angle + PI / 3));
	float p3y = p2y + (float)(len * Math.sin(angle + PI / 3));
	float p4x = p1x + 2 * (float)(len * Math.cos(angle));
	float p4y = p1y + 2 * (float)(len * Math.sin(angle));
	float p5x = p4x + (float)(len * Math.cos(angle));
	float p5y = p4y + (float)(len * Math.sin(angle));
	if(len <= lim)
	{
		if(0 < p1x && p1x < width && 0 < p1y && p1y < height && 0 < p2x && p2x < width && 0 < p2y && p2y < height)
			line(p1x, p1y, p2x, p2y);
		if(0 < p2x && p2x < width && 0 < p2y && p2y < height && 0 < p3x && p3x < width && 0 < p3y && p3y < height)
			line(p2x, p2y, p3x, p3y);
		if(0 < p3x && p3x < width && 0 < p3y && p3y < height && 0 < p4x && p4x < width && 0 < p4y && p4y < height)
			line(p3x, p3y, p4x, p4y);

		if(0 < p4x && p4x < width && 0 < p4y && p4y < height && 0 < p5x && p5x < width && 0 < p5y && p5y < height)
			line(p4x, p4y, p5x, p5y);
		

	}
	else
{
		fractal(p1x, p1y, len / 3, angle);
		fractal(p2x, p2y, len / 3, angle + PI / 3);
		fractal(p3x, p3y, len / 3, angle - PI / 3);
		fractal(p4x, p4y, len / 3, angle);
	}
		
}