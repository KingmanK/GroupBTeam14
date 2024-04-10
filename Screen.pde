class Screen {
 ArrayList<Widget> screenWidgets;
 color screenColor;
 Screen(color screenColor){
   screenWidgets=new ArrayList<Widget>();
   this.screenColor=screenColor;
 }
 void add(Widget w){
 screenWidgets.add(w);
 }
void mouseMoved(){
    for(Widget aWidget : screenWidgets){
      int event = aWidget.getEvent(mouseX,mouseY);
      if(event != EVENT_NULL){
        aWidget.mouseOver();
      }
      else {
        aWidget.mouseNotOver();
      }
      aWidget.draw();
    }
    
  if (currentScreen != mainScreen){
    image(img, 0, 0);
  }
}

void draw(){
 background(screenColor);
 for(int i = 0; i < screenWidgets.size(); i++){
 Widget aWidget = (Widget)screenWidgets.get(i);
 aWidget.draw();
 }
}

int getEvent(int mx, int my){
 for(int i = 0; i<screenWidgets.size(); i++){
 Widget aWidget = (Widget) screenWidgets.get(i);
 int event = aWidget.getEvent(mouseX,mouseY);
 if(event != EVENT_NULL){
 return event;
 }
 }
 return EVENT_NULL;
}
ArrayList<Widget> getWidgets()
{
 return screenWidgets;
}
}
