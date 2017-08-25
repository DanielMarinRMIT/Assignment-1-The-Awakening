//Drawing Program by Daniel Marin - S3589260
//===========================================
//This file contains many tool variables and hotkey code.


//Establishing the stroke weight integer and setting it to 3.
int SW = 3;

//Establishing the hue, saturation, and brightness floats.
float hue = 50;
float sat = 50;
float brt = 50;

//Establishing integers for the variable brush weight used by the paint brush tool.
int MDX = 0;  //Mouse Movement speed for X
int MDY = 0;  //Mouse Movement speed for Y
int LS = 0;  //Resultant Stroke Weight

//===========================================

//Code used to setup hoykeys for stroke weight.
void strokeWeightControl() 

{ 
  //Increase stroke weight.
  if (keyPressed) 
  {
    if (key == '+') 
    {
      SW += 1;
    }
  }
  
  //Decrease stroke weight.
  if (keyPressed) 
  {
    if (key == '-') 
    {
      if(SW >= 2)  //Prevents stroke weight from decreasing below 1.
      {
        SW -= 1;
      }
    }
  }
}

//==============================================

//Code used to setup hotkeys for hue, saturation, and brightness keyboard controls.
void colourControl() 

{
  //Insrease hue.
  if (keyPressed) 
  {
    if (key == 'q') 
    {
      if(hue <= 100)  //Limits to maximum hue.
      {
        hue += 1;
      }
    }
  }
  
  //Decrease hue.
  if (keyPressed) 
  {
    if (key == 'a') 
    {
      if(hue >= 1)  //Limits to minimum hue.
      {
        hue -= 1;
      }
    }
  }
  
  //Increase saturation.
  if (keyPressed) 
  {
    if (key == 'w') 
    {
      if(sat <= 100)  //Limits to maximum saturation.
      {
        sat += 1;
      }
    }
  }
  
  //Decrease saturation.
  if (keyPressed) 
  {
    if (key == 's') 
    {
      if(sat >= 1)  //Limits to minimum saturation.
      {
        sat -= 1;
      }
    }
  }
  
  //Increase brightness.
  if (keyPressed) 
  {
    if (key == 'e') 
    {
      if(brt <= 100)  //Limits to maximum brightness.
      {
        brt += 1;
      }
    }
  }
  
  //Decrease brightness.
  if (keyPressed) 
  {
    if (key == 'd') 
    {
      if(brt >= 1)  //Limits to minimum brightness.
      {
        brt -= 1;
      }
    }
  }
}