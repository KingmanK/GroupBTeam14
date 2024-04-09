class Textbox {
   int x, y, h, w;
  
   color Background = color(140, 140, 140);
   color textColour = color(0, 0, 0);
   color BackgroundSelected = color(160, 160, 160);
   color Border = color(30, 30, 30);
   
   String Text = "";
   int TextLength = 0;

   boolean selected = false;
   
   Textbox(int x, int y, int h, int w) {
      this.x = x; this.y = y; this.h = h; this.w = w;
   }
   
   void draw() {
      noStroke();
      if (selected) {
         fill(BackgroundSelected);
      } else {
         fill(Background);
      }
      
      rect(x, y, w, h);
      
      fill(textColour);
      
      textAlign(LEFT, CENTER);
      textSize(20);  // Search Bar Text Size
      text(Text, x + 5, y + 17);
   }
   
   void addText(char text) {
      if (textWidth(Text + text) < w - 10) {
         Text += text;
         TextLength++;
      }
   }
   void BACKSPACE() {
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   boolean KeyPressed(char KEY, int KEYCODE) {
      if (selected) {
         if (KEYCODE == BACKSPACE) {
            BACKSPACE();
         }
         else if (KEYCODE == ENTER) {
            return false;
         }
         else if (KEY != CODED) { // CODED prevents special characters from displaying in the search bar
            addText(KEY);
         }
      }
      return false;
   }
   
   boolean isOverBox(int x, int y) {
      if (x >= 540 && x <= 540 + 200 && y >= 325 && y <= 325 + 35) {
        return true;
      }
      
      
      return false;
   }
   
   void pressed(int x, int y) {
      if (isOverBox(x, y)) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
