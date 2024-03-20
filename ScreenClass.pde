
ArrayList<Widget> widgetList = new ArrayList<Widget>();
PFont stdFont;
final int EVENT_BUTTON1=1; final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3; final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2;
void setup(){
 Widget widget1, widget2, widget3, widget4;
 stdFont=loadFont("CooperBlack-20.vlw");
 textFont(stdFont);
 widget1=new Widget(100, 100, 180, 40,
 "Button 1", color(200, 0, 0), stdFont, EVENT_BUTTON1);
 widget2=new Widget(100, 200, 180, 40,
 "Forward", color(0, 200, 0), stdFont, EVENT_FORWARD);
 widget3=new Widget(100, 100, 180, 40,
 "Button 2", color(0,0,200), stdFont, EVENT_BUTTON2);
 widget4=new Widget(100, 200, 180, 40,
 "Backward", color(0,200,200), stdFont, EVENT_BACKWARD);
 size(400, 400);
 widgetList.add(widget1);
 widgetList.add(widget2);
// Add other widgets as needed

 screen1 = new Screen(color(255));
 screen2 = new Screen(color(150));
 screen1.add(widget1);
 screen1.add(widget2);
 screen2.add(widget3);
 screen2.add(widget4);
 currentScreen = screen1;
}

void draw(){
  for(int i = 0; i<widgetList.size(); i++){
  Widget aWidget = (Widget) widgetList.get(i);
  aWidget.draw();
  currentScreen.draw();
  }
}

void mousePressed(){
 switch(currentScreen.getEvent(mouseX, mouseY)) {
 case EVENT_BUTTON1:
 println("button 1!");
 break;
 case EVENT_BUTTON2:
 println("button 2!");
 break;
 case EVENT_FORWARD:
 println("forward"); currentScreen = screen2;
 break;
 case EVENT_BACKWARD:
 println("backward"); currentScreen = screen1;
 break;
 }
}

class Screen {
 ArrayList screenWidgets;
 color screenColor;
 Screen(color screenColor){
 screenWidgets=new ArrayList();
 this.screenColor=screenColor;
 }
 void add(Widget w){
 screenWidgets.add(w);
 }

void draw(){
 background(screenColor);
 for(int i = 0; i<screenWidgets.size(); i++){
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
ArrayList getWidgets()
{
 return screenWidgets;
}
}
