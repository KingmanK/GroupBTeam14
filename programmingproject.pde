// Group B Team 14 - Programming Project
import java.util.ArrayList;

Table dataFile;
ArrayList<String> displayData; 
ArrayList<Widget> widgetList = new ArrayList<Widget>();
PFont stdFont;
final int EVENT_BUTTON1=1; final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3; final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2;

void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);
  /* read_in_the_file();
  result = default_query();
  current_query = query3; // whatever type of query is default */
  size(800,400);
  
  Widget widget1, widget2, widget3, widget4;
 //stdFont=loadFont("Georgia");
 //textFont(stdFont);
 PFont myFont = loadFont("AmericanTypewriter-12.vlw");
 textFont(myFont);
 
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
    background(0);
  //PFont myFont = loadFont("AmericanTypewriter-12.vlw");
  PFont myFont = loadFont("AmericanTypewriter-12.vlw");
  textFont(myFont);
  int margin = 0;
  for (int i = 0; i < displayData.size(); i++) {
    text(displayData.get(i), 20, 20 + margin);
    println(displayData.get(i));
    margin += 20;
  }
  
  
    for(int i = 0; i<widgetList.size(); i++){
  Widget aWidget = (Widget) widgetList.get(i);
  aWidget.draw();
  currentScreen.draw();
  }
  }
  /////////////////////////
 

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

void fileReader(Table data) {
      
      int columns = data.getColumnCount();
      int rows = data.getRowCount();
      DataPoint newPoint;
      
      ArrayList<DataPoint> values = new ArrayList<DataPoint>();
  
     for (int i = 0; i < rows; i++) {
       newPoint = new DataPoint(data.getRow(i));
       values.add(newPoint);
     }
     
     displayData = new ArrayList<String>();
     
     for (int j = 0; j < values.size(); j++) {
       
        displayData.add(values.get(j).FL_DATE + " "
        + values.get(j).MKT_CARRIER + " "
        + values.get(j).MKT_CARRIER_FL_NUM + " "
        + values.get(j).ORIGIN + " "
        + values.get(j).ORIGIN_CITY_NAME + " "
        + values.get(j).ORIGIN_STATE_ABR + " "
        + values.get(j).ORIGIN_WAC + " "
        + values.get(j).DEST + " "
        + values.get(j).DEST_CITY_NAME + " "
        + values.get(j).DEST_WAC + " "
        + values.get(j).CRS_DEP_TIME + " "
        + values.get(j).DEP_TIME + " "
        + values.get(j).CRS_ARR_TIME + " "
        + values.get(j).ARR_TIME + " "
        + values.get(j).CANCELLED + " "
        + values.get(j).DIVERTED + " "
        + values.get(j).DISTANCE + "\n");
     
     }
}
