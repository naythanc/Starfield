Particle [] space = new Particle[200];

void setup()
{
	size(800,800);
	frameRate(50);
	for (int i = 0; i<space.length; i++)
	{
		space[i] = new NormalParticle();
	}
	space[0] = new OddballParticle();
	space[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i=0;i<space.length; i++)
	{
		space[i].move();
		space[i].show();
	}
}
class NormalParticle implements Particle
{
		double dX,dY,dSpeed,dTheta;

	NormalParticle()
	{
		dX = 256;
		dY = 256;
		dSpeed = (double)(Math.random()*2);
		dTheta = (double)(Math.random()*2*Math.PI);
	}
	public void move()
	{
		dX = dX+Math.cos(dTheta)*dSpeed;
		dY = dY+Math.sin(dTheta)*dSpeed;
		dTheta+=0.01;

	}
	public void show()
	{
		noStroke();
		fill(255);
		ellipse((float)dX, (float)dY, 2, 2);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{

	float x, y, speed, angle;
	int dX=1;
	int dY=1;
	OddballParticle()
	{
		x= (float)(Math.random()*14);
		y=(float)(Math.random()*20);
		speed=(float)(Math.random()*2*Math.PI);
		angle=(float)(Math.random()*3);
	}

	public void move()
	{
		if(x<6)
		{
			dX=1;
		}
		if(x>526)
		{
			dX=-1;
		}
		if (y<0)
		{
			dY=1;
		}
		if(y>599)
		{
			dY=-1;
		}
		x+=4*dX+3;
		y+=4*dY;
	}
	public void show()
	{
		noStroke();
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		textSize(20);
		text("star",(float)x+5, (float)y);
	}

}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		ellipse((float)dX, (float)dY, 60, 60);
	}
}

