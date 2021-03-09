PImage bg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;
int soldierLevel,soldierX;
int robotLevel,robotX;
int laserX,laserWidth;

void setup() {
  size(640, 480, P2D);
bg=loadImage("img/bg.jpg");
groundhog=loadImage("img/groundhog.png");
life=loadImage("img/life.png");
robot=loadImage("img/robot.png");
soil=loadImage("img/soil.png");
soldier=loadImage("img/soldier.png");

//soldier appear
soldierLevel=floor(random(2,6))*80;
soldierX=0;

//robot appear
robotLevel=floor(random(2,6))*80;
robotX=floor(random(2,8))*80;

laserX=robotX+25;
laserWidth=0;

}

void draw() {
  
  //background setup
  image(bg,0,0);
  image(soil,0,160);
  image(life,10,10);
  image(life,81,10);
  image(life,152,10);
  
  //draw ground
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
  
  //draw sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(590,50,120,120);
  
  image(groundhog,280,80);

  //soldier walk
  soldierX=(soldierX+4);
  image(soldier,soldierX%720-80,soldierLevel); 
  
  image(robot,robotX,robotLevel);
  
  //laser shot
  strokeWeight(10);
  stroke(#FF0000);
  line(laserX,robotLevel+37,laserX-laserWidth,robotLevel+37);
  laserX=laserX-2; //Max:laserX-150
  laserWidth=min(laserWidth+1,30);
  
  if(robotX-laserX>125){
  laserX=robotX+25;
  laserWidth=0;
  }
}
