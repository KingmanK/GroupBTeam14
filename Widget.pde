class Widget {
     
   //Instantiates Widget Variables
   int x, y, width, height; String label; int event;
   color widgetColor, labelColor, lineColor; PFont widgetFont; boolean lineStroke;
   
   //Defines Widget Variables using constructors
   Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event, boolean lineStroke) { 
     this.x = x; this.y = y; this.width = width; this.height = height; this.label = label; this.event = event;
     this.widgetColor = widgetColor; this.widgetFont = widgetFont; this.lineStroke = lineStroke; labelColor = color(0); lineColor = color(0);
   } 
   
   void draw() {
     //Sets widget color
     fill(widgetColor); 
     
     //Checks if a widget should have an outline
     if (lineStroke) { 
       stroke(lineColor);  
       rect(x, y, width, height); 
     }
     
     //Sets text label color and dimensions
     fill(labelColor); 
     text(label, x + 10, y + height - 10);
   }
   
   //Checks if the mouse is moved
   void mouseMoved() {
     int event;
     ArrayList widgetList = currentScreen.getWidgets();
     
     for(int i = 0; i<widgetList.size(); i++) {
       Widget aWidget = (Widget) widgetList.get(i);
       
       //Checks if the mouse is over a widget when clicked
       event = aWidget.getEvent(mouseX,mouseY);
       
       if(event != EVENT_NULL){
         aWidget.mouseOver();
       }
       
       else {
         aWidget.mouseNotOver();
       }
       
       //Draws the widget that was clicked
       aWidget.draw();
     }
   }
   
   //Changes the color of the widget's outline depending on whether the mouse is over it or not
   void mouseOver() {
      if (lineStroke) {
        lineColor = color(255);
      }
   }
   
   void mouseNotOver() {
      if (lineStroke) {
        lineColor = color(0);
      }
   }
   
   //Finds which widget was clicked by the mouse
   int getEvent(int mX, int mY) { 
     if(mX > x && mX < x + width && mY > y && mY < y + height) {
       return event;
     } 
     //If none, returns NULL
     return EVENT_NULL; 
   }
}
