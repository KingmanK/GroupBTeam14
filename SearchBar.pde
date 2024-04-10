class Textbox {
   
   //Dimensions and Color Variables
   int x, y, h, w;
  
   color Background = color(140, 140, 140);
   color textColour = color(0, 0, 0);
   color BackgroundSelected = color(160, 160, 160);
   color Border = color(30, 30, 30);
   
   //Text Variables
   String Text = "";
   int TextLength = 0;
    
   //Tracks whether the Search Bar is selected
   boolean selected = false;
   
   //Defines Dimensions
   Textbox(int x, int y, int h, int w) {
      this.x = x; this.y = y; this.h = h; this.w = w;
   }
   
   void draw() {
      noStroke();
      
      //Changes background color based on whether the Search Bar is selected
      if (selected) {
         fill(BackgroundSelected);
      } 
      
      else {
         fill(Background);
      }
      
      //Displays the Search Bar
      rect(x, y, w, h);
      fill(textColour);
      
      textAlign(LEFT);
      textSize(20);
      text(Text, x + 5, y + 17);
   }
   
   //Adds text typed to the Search Bar text display
   void addText(char text) {
      if (textWidth(Text + text) < w - 10) {
         Text += text;
         TextLength++;
      }
   }
   
   //Deletes text from the display when backspace is pressed
   void BACKSPACE() {
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   
   //Checks if valid keys are pressed
   boolean KeyPressed(char KEY, int KEYCODE) { 
     if (selected) {
         //Checks for BACKSPACE
         if (KEYCODE == BACKSPACE) {
            BACKSPACE();
         }
         //Checks for ENTER
         else if (KEYCODE == ENTER) {
            return false;
         }
         //Prevents special characters from displaying in the search bar
         else if (KEY != CODED) {
            addText(KEY);
         }
      }
      return false;
   }
   
   //Checks if the mouse if over the Search Bar
   boolean isOverBox(int x, int y) {
      if (x >= 540 && x <= 540 + 200 && y >= 325 && y <= 325 + 35) {
        return true;
      }
      
      
      return false;
   }
   
   //Checks if the mouse has been pressed
   void pressed(int x, int y) {
      if (isOverBox(x, y)) {
         selected = true;
      } 
      else {
         selected = false;
      }
   }
}
