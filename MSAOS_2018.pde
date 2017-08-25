//Drawing Program by Daniel Marin - S3589260
//===========================================
//This is the main file.


//Variable to select the tool type.
int TT = 8;

//Flags that record where the mouse has clicked, and when it has released for the drawing of rectangles and ellipses.
int mouseX1 = 0;
int mouseX2 = 0;
int mouseY1 = 0;
int mouseY2 = 0;

//-------------------------------------------

//Images for the User Interface.
PImage pbi;  //Paintbrush Icon
PImage era;  //Eraser Icon  
PImage nwc;  //Generate New Canvas Icon
PImage cwc;  //Generate New Coloured Canvas Icon
PImage pnc;  //Pencil Icon
PImage sqr;  //Rectangle Tool Icon
PImage cir;  //Ellipse Tool Icon
PImage lin;  //Line Tool Icon
PImage spc;  //Spray Can Icon
PImage eye;  //Eyedropper Icon
PImage sve;  //Save Artwork Icon

//Images to use as brushes.
PImage spr;  //Spray Can Spray

//UI effects.
PImage slb;  //Indentation for a selected icon.

//Addtional UI Images.
PImage pls;  //Plus Button
PImage mns;  //Minus Button
PImage bnr;  //UI Banner

PImage spl;  //Splash Screen Image

//--------------------------------------------

//Fonts
PFont f; //Arial

//============================================

//Code to be run once when the program is launched.
void setup()

{
  
  
  //Settings for Arial font.
  f = createFont("Arial",8,true); //Font size is 8.
  
  //Establishing background colour, and the size of the window. Also setting the colour mode to HSB.
  background(255,255,255);
  size(1920,1080);
  colorMode(HSB,100,100,100);
  
  //-------------------------------------------
  
  //Importing Images from the Data folder.
  pbi = loadImage("paintBrushIcon.jpg");
  pnc = loadImage("pencil.jpg");
  era = loadImage("eraser.jpg");
  nwc = loadImage("newCanvas.jpg");
  cwc = loadImage("colourCanvas.jpg");
  pls = loadImage("Plus.jpg");
  mns = loadImage("Minus.jpg");
  slb = loadImage("selectedBox.png");
  sqr = loadImage("Square.jpg");
  cir = loadImage("Circle.jpg");
  lin = loadImage("Line.jpg");
  spc = loadImage("SprayCan.jpg");
  spr = loadImage("Spray.png");
  eye = loadImage("eyeDropper.jpg");
  sve = loadImage("save.jpg");
  bnr = loadImage("banner.jpg");
  spl = loadImage("SplashScreen.jpg");
  
}

//================================================

//Code to continue running over again until the program is terminated.
void draw()

{
  
  //Running functions from Brush_Control. These will introduce hotkeys that can control the weight, hue, saturation, and brightness of any tool.
  strokeWeightControl();
  colourControl();
  
  //-----------------------------------------------
  
  //Drawing the UI into the frame.
  
  //Placing the banner across the top of the plane. Consumes 70 vertical pixels for UI.
  image(bnr,0,0,1920,75);  
  
  //Drawing UI icons into the frame.
  image(pbi,250,10,50,50);
  image(pnc,190,10,50,50);
  image(era,130,10,50,50);
  image(nwc,10,10,50,50);
  image(cwc,70,10,50,50);
  image(sqr,310,10,50,50);
  image(cir,370,10,50,50);
  image(lin,430,10,50,50);
  image(spc,490,10,50,50);
  image(eye,550,10,50,50);
  image(sve,670,10,50,50);
  
  image(pls,1870,10,40,15);
  image(mns,1670,10,40,15);
  image(pls,1870,25,40,15);
  image(mns,1670,25,40,15);
  image(pls,1870,40,40,15);
  image(mns,1670,40,40,15);
  image(pls,1565,10,50,27);
  image(mns,1565,37,50,28);
  
  //------------------------------------------------
  
  //Draws the brush weight UI.
  fill(0,0,255);  //Sets fill colour to white.
  noStroke();
  rect(1615,10,55,55); //Draws rectangle frame.
  fill(hue,sat,brt); //Sets fill colour to the selected tool colour.
  int EM = SW*2;  //Increases the scale of the weight in the UI for better visibility.
  if(EM>40){EM = 39;}  //If the scale of the weight approaches the size of the rectangle frame, it will stop growing.
  ellipse(1650,30,EM,EM);  //Draws the weight represented by an ellipse.
  fill(0); //Sets fill to black for text.
  textFont(f,16);  //Sets font to arial at size 16.
  text(SW,1620,60);  //Text that will tell use the exact weight of the selected tool.
  
  //------------------------------------------------
  
  //Draws hue, saturation, and brightness spectrums to assist in tool colour selection.
  //Loop that generates a hue spectrum that updates based on the selected hue.
  for(int x1 = 0; x1<148; x1++)
  {
    noStroke();
    fill((hue+x1-80),125,125);
    rect(1711+x1,10,15,15);
  }
  //A nearly Identical loop for saturation.
  for(int x2 = 0; x2<148; x2++)
  {
    noStroke();
    fill(hue,(sat+x2-80),125);
    rect(1711+x2,25,15,15);
  }
  //And a loop for birghtness.
  for(int x3 = 0; x3<148; x3++)
  {
    noStroke();
    fill(hue,125,(brt+x3-80));
    rect(1711+x3,40,15,15);
  }
  
  //A thin black rectangle that indicates the current selected hue, saturation, and brightness on the loop spectrums.
  fill(0,0,0);
  rect(1793,10,4,45);
  
  //A thin rectangle strip underneath the spectrums that will show the current selected colour.
  fill(hue,sat,brt);
  rect(1670,55,240,10);
  
  //Code to display the splash screen for the first 5 seconds of the program.
  if(millis() < 5100)
  {
    fill(0,0,255);
    rect(0,0,1920,1080); //Underneath the splash screen will be a white rectangle that will overlay the splash screen once it is no longer needed.
  }
  if(millis() < 5000)
  {
    image(spl,0,0,1920,1080);  
  }

  
  //---------------------------------------------------
  
  //Establishing properties for the variable weight paint brush.
  MDX = mouseX-pmouseX; //Records the speed at which the mouse is moved on the horizontal axis.
  MDY = mouseY-pmouseY; //Records the speed at which the mouse is moved on the vertical axis.
  LS = SW*20-SW*((abs(MDX)*abs(MDY))/200);  //Takes the absolute value of these speeds and arranges them into an appropriate stroke weight.
    
  //The variable stroke weight will be prevented from becoming too small.
  if (LS < SW*5)
  {
    LS = SW*6;
  }
  
  //---------------------------------------------------
    
  //Actions that occur when the mouse is pressed and the paint brush tool is used.
  if(TT == 0)
  {
    image(slb,250,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    if(mousePressed) 
    {
      if(mouseY>70)  //The tool will only operate below the UI banner.
      {  
        stroke(hue,sat,brt);  //The brush is set to have the current user selected hue, saturation, and brightness.
        strokeWeight(LS);  //The stroke weight is set to the variable "LS" stroke weight that was degined earlier.
        line(mouseX,mouseY,pmouseX,pmouseY);  //Lines are drawn between mousepositions to create a continuous brush stroke.
      }
    }
  }
  
  //For when the eraser is used.
  if(TT == 1)
  {
    image(slb,130,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    if(mousePressed) 
    {
      if(mouseY>70)  //The tool will only operate below the UI banner.
      {  
        stroke(0,0,255);  //The eraser is set to draw white.
        strokeWeight(SW*8);  //The eraser will have 8 times the default stroke weight.
        line(mouseX,mouseY,pmouseX,pmouseY);  //Lines are drawn between mousepositions to create a continuous eraser stroke.
      }
    }
  }
  
  //For when the pencil is used.
  if(TT == 2)
    {
    image(slb,190,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    if(mousePressed) 
      {
      if(mouseY>70) //The tool will only operate below the UI banner.
        {  
          stroke(hue,sat,brt);  //The pencil is set to have the current user selected hue, saturation, and brightness.
          strokeWeight(SW*2);  //The pencil will have 2 times the default stroke weight.
          line(mouseX,mouseY,pmouseX,pmouseY);  //Lines are drawn between mousepositions to create a continuous pencil stroke.
        }
     }
  }
  
  //For when the rectangle tool is used.
  if(TT == 3)
  {
    image(slb,310,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    //Much of the rectangle, ellipse, and lines coding can be found within the "Button_Clicking" file.
  }
    
  //For when the ellipse tool is used.
  if(TT == 4)
  {
    image(slb,370,10,50,50);  //A selection indentation is added to the paint brush tool icon.
  }
    
  //For when the line tool is used.
  if(TT == 5)
  {
    image(slb,430,10,50,50);  //A selection indentation is added to the paint brush tool icon.
  }
    
  //For when the spray can tool is used.
  if(TT == 6)
  {
    image(slb,490,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    if(mousePressed) 
    {
      if(mouseY>70)  //The tool will only operate below the UI banner.
      {  
        tint(hue,sat,brt);  //The spray image will be tinted based on the hue, saturation, and brightness that the user has chosen.
        strokeWeight(SW*2);  //Strokeweight is set to 2.
        image(spr,mouseX-SW*5,mouseY-SW*5,SW*10,SW*10);  //The spray image will be centres to the mouse and will be the size of the strokeweight multiplied by 10.
        noTint();  // Tint will be discarded for any future code.
      }
    }
  }
  
  //For when the eye dropper tool is used.
  if(TT == 7)
  {
    image(slb,550,10,50,50);  //A selection indentation is added to the paint brush tool icon.
    if(mousePressed) 
    {
    if(mouseY>70)  //The tool will only operate below the UI banner.
      {  
      hue = hue(get(mouseX,mouseY));  //When clicked, pixel hue will be collected from where the mouse is located.
      sat = saturation(get(mouseX,mouseY));  //When clicked, pixel saturation will be collected from where the mouse is located.
      brt = brightness(get(mouseX,mouseY));  //The same goes for brightness.
      }
    }
  }
}