class Screen {
 
  ArrayList<Widget> screenWidgets;
  color screenColor;
 
  //Initializes constructors and variables
  Screen(color screenColor) {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
  }
 
  //Adds given widget to screen
  void add(Widget w) {
     screenWidgets.add(w);
  }
  
  //Checks if the mouse is moved
  void mouseMoved() {
     for(Widget aWidget : screenWidgets) {
       int event = aWidget.getEvent(mouseX, mouseY);
        
       if(event != EVENT_NULL) {
         aWidget.mouseOver();
       }
        
       else {
         aWidget.mouseNotOver();
       }
        
       aWidget.draw();
     }
      
     if (currentScreen != mainScreen) {
       image(img, 0, 0);
    }
  }
  
  void draw() {
    //Sets background color and displays screen widgets
    background(screenColor);
    
    for(int i = 0; i < screenWidgets.size(); i++) {
       Widget aWidget = (Widget)screenWidgets.get(i);
       aWidget.draw();
    }
  }
  
  //
  int getEvent(int mx, int my) {
    
    //Checks if any buttons are clicked on
    for(int i = 0; i < screenWidgets.size(); i++) {
      Widget aWidget = (Widget) screenWidgets.get(i);
      int event = aWidget.getEvent(mouseX, mouseY);
      
      if(event != EVENT_NULL) {
         //If so, returns that button
         return event;
      }
    }
    
    //Otherwise returns NULL
    return EVENT_NULL;
  }
  
  //Returns of list of widgets used on this Screen
  ArrayList<Widget> getWidgets() {
    return screenWidgets;
  }
}
