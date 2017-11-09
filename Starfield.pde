//your code here
void setup()
{
	size(800,800);
	frameRate(50);
	for (int i = 0; i<glass.length; i++)
	{
		glass[i] = new NormalParticle();
	}
	glass[0] = new OddballParticle();
	glass[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i=0;i<glass.length; i++)
	{
		glass[i].move();
		glass[i].show();
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
		//ellipse((float)x, (float)y, 30, 30);
		textSize(20);
		text("ಥ‿ಥ",(float)x+5, (float)y);
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

