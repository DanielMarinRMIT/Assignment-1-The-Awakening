//Drawing Program by Daniel Marin - S3589260
//===========================================
//This file contains UI button properties and shape drawing code.

//Code for when the mouse is pressed over buttons.
void mousePressed()

{

if(millis() > 3000) //Buttons will not be usable until the splash screen has dissapeared.

{
  
  //Establishes a flag for when the mouse is clicked somewhere within the frame for when using shape drawing tools.
  mouseX1 = mouseX;
  mouseY1 = mouseY;

  //--------------------------------------------
  
  //Button mapping for the pencil tool.
  if (mouseX > 190 && mouseX <240)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 2;
      }
    }
  }
  
  //Button mapping for the eraser tool.
  if (mouseX > 130 && mouseX <180){
    if (mouseY > 10 && mouseY <60){
      if (mouseButton == LEFT){
        TT = 1;
      }
    }
  }
  
  //Button mapping for the paint brush tool.
  if (mouseX > 250 && mouseX <300)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 0;
      }
    }
  }
  
  //Button mapping for the rectangle tool.
  if (mouseX > 310 && mouseX <360)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 3;
      }
    }
  }
  
  //Button mapping for the ellipse tool.
  if (mouseX > 370 && mouseX <420)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 4;
      }
    }
  }
  
  //Button mapping for the line tool.
  if (mouseX > 430 && mouseX <480)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 5;
      }
    }
  }
  
  //Button mapping for the eye dropper tool.
  if (mouseX > 550 && mouseX <600)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 7;
      }
    }
  }
  
  //Button mapping for the spray can tool.
  if (mouseX > 490 && mouseX <540)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        TT = 6;
      }
    }
  }
  
  //Button mapping for the save artwork button.
  if (mouseX > 670 && mouseX <720)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        PImage partialSave = get(0,70,1920,1080);
        partialSave.save("ArtWork.jpg");;
        image(slb,70,10,50,50);
      }
    }
  }
  
  //Button mapping for the new canvas button.
  if (mouseX > 10 && mouseX <60)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        background(0,0,255);
      }
    }
  }
  
  //Button mapping for the new coloured canvas button.
  if (mouseX > 70 && mouseX <120)
  {
    if (mouseY > 10 && mouseY <60)
    {
      if (mouseButton == LEFT)
      {
        background(hue,sat,brt);
      }
    }
  }
  
  //_________________________________________________________
  
  
  //Button mapping for the increase stroke weight button.
  if (mouseX > 1565 && mouseX <1615)
  {
    if (mouseY > 10 && mouseY <37)
    {
      if (mouseButton == LEFT)
      {
        SW += 1;
      }
    }
  }
  
  //Button mapping for the decrease stroke weight button.
  if (mouseX > 1565 && mouseX <1615)
  {
    if (mouseY > 38 && mouseY <65)
    {
      if (mouseButton == LEFT)
      {
        if(SW> 1)
        {
        SW -= 1;
        }
      }
    }
  }
  
  //_________________________________________________________
  
  //Button mapping for the decrease hue button.
  if (mouseX > 1670 && mouseX <1710)
  {
    if (mouseY > 10 && mouseY <25)
    {
      if (mouseButton == LEFT)
      {
        hue -= 5;
      }
    }
  }
  
  //Button mapping for the increase hue button.
  if (mouseX > 1870 && mouseX <1910)
  {
    if (mouseY > 10 && mouseY <25)
    {
      if (mouseButton == LEFT)
      {
        hue += 5;
      }
    }
  }
  
  //________________________________________________________
  
  //Button mapping for the decrease saturation button.
  if (mouseX > 1670 && mouseX <1710)
  {
    if (mouseY > 25 && mouseY <40)
    {
      if (mouseButton == LEFT)
      {
        sat -= 10;
      }
    }
  }
  
  //Button mapping for the increase saturation button.
  if (mouseX > 1870 && mouseX <1910)
  {
    if (mouseY > 25 && mouseY <40)
    {
      if (mouseButton == LEFT)
      {
        sat += 10;
      }
    }
  }
  
  //_________________________________________________________
        
  //Button mapping for the decrease brightness button.
  if (mouseX > 1670 && mouseX <1710){
    if (mouseY > 40 && mouseY <55){
      if (mouseButton == LEFT){
        brt -= 10;
      }
    }
  }
  
  //Button mapping for the increase brightness button.
  if (mouseX > 1870 && mouseX <1910){
    if (mouseY > 40 && mouseY <55){
      if (mouseButton == LEFT){
        brt += 10;
      }
    }
  }
}
}

//==========================================================

//Code for drawing shapes.
void mouseReleased()

{
  
  //Establishes a flag for when the mouse is released somewhere within the frame
  mouseX2 = mouseX;
  mouseY2 = mouseY;
    
  //A rectangle will be drawn when the mouse button is released.  
  if(TT == 3)
  {
    if(mouseY>70)
    {  
      stroke(hue,sat,brt);
      strokeWeight(SW*2);
      fill(hue,sat,brt);
      rect(mouseX1,mouseY1,mouseX2-mouseX1,mouseY2-mouseY1);
    }
  }
  
  //An ellipse will be drawn when the mouse button is released.  
  if(TT == 4)
  {
    if(mouseY>70)
    {  
      stroke(hue,sat,brt);
      strokeWeight(SW*2);
      fill(hue,sat,brt);
      ellipseMode(CORNER);
      ellipse(mouseX1,mouseY1,mouseX2-mouseX1,mouseY2-mouseY1);
    }
  }
  
  //A line will be drawn when the mouse button is released.  
  if(TT == 5)
  {
    if(mouseY>70)
    {  
      stroke(hue,sat,brt);
      strokeWeight(SW*2);
      fill(hue,sat,brt);
      line(mouseX1,mouseY1,mouseX2,mouseY2);
    }
  }
}