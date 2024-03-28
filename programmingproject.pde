// Group B Team 14 - Programming Project
import java.util.ArrayList;

Table dataFile;
pieChart PieChart;
int total;
ArrayList<String> displayData; 
ArrayList<Widget> widgetList = new ArrayList<Widget>();
PFont stdFont;
final int EVENT_BUTTON1=1; final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3; final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2;
Textbox TB;
//ArrayList<Textbox> textboxes = new ArrayList<Textbox>();
 ArrayList<DataPoint> values = new ArrayList<DataPoint>();
 
void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);
 size(1280, 720);
  
  Widget widget1, widget2, widget3, widget4;
 PFont myFont = loadFont("AmericanTypewriter-12.vlw");
 textFont(myFont);
 
 widget1=new Widget(100, 100, 180, 40,
 "Button 1", color(200, 0, 0), stdFont, EVENT_BUTTON1);
 widget2=new Widget(100, 200, 180, 40,
 "Flights status", color(0, 200, 0), stdFont, EVENT_FORWARD);
 widget3=new Widget(100, 100, 180, 40,
 "Button 2", color(0,0,200), stdFont, EVENT_BUTTON2);
 widget4=new Widget(100, 200, 180, 40,
 "Backward", color(0,200,200), stdFont, EVENT_BACKWARD);
 
 widgetList.add(widget1);
 widgetList.add(widget2);

 screen1 = new Screen(color(70));
 screen2 = new Screen(color(150));
 screen1.add(widget1);
 screen1.add(widget2);
 screen2.add(widget3);
 screen2.add(widget4);
 currentScreen = screen1;
 
 PieChart = new pieChart();
 total = dataFile.getRowCount();
 noStroke();
 PieChart.getData();
 
 
 TB = new Textbox(540,  325,  35,  200);
 //textboxes.add(TB);

}

  void draw(){
    background(0);
    PFont myFont = loadFont("AmericanTypewriter-12.vlw");
    textFont(myFont);
    int margin = 0;
    for (int i = 0; i < displayData.size(); i++) {
      text(displayData.get(i), 20, 20 + margin);
      //println(displayData.get(i));
      margin += 20;
    }
  
    currentScreen.draw();
    
    if (currentScreen == screen2){
      PieChart.draw();
    }
    
   /*for (Textbox t : textboxes) {
      t.DRAW();
   }*/
   
   TB.DRAW();

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
 println("Flights status"); currentScreen = screen2;
 break;
 case EVENT_BACKWARD:
 println("backward"); currentScreen = screen1;
 break;
 }
 
 /* for (Textbox t : textboxes) {
      t.pressed(mouseX, mouseY);
   }*/
   
  TB.pressed(mouseX, mouseY);
}


void mouseMoved(){
  currentScreen.mouseMoved();
}
void fileReader(Table data) {
      
      int columns = data.getColumnCount();
      int rows = data.getRowCount();
      DataPoint newPoint;
      
      //ArrayList<DataPoint> values = new ArrayList<DataPoint>();
  
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
 DataPoint findLongestDelay(ArrayList<DataPoint> flights) {
  DataPoint longestDelayFlight = null;
  int longestDelay = -400;
  
  for (DataPoint flight : flights) {
    int depDelay = Integer.parseInt(flight.DEP_TIME) -  Integer.parseInt(flight.CRS_DEP_TIME);
    int arrDelay = Integer.parseInt(flight.ARR_TIME) -  Integer.parseInt(flight.CRS_ARR_TIME);
    int totalDelay = depDelay + arrDelay;
    
    if (totalDelay > longestDelay) {
      longestDelay = totaldelay;
      longestDelayFlight = flight;
  }
  }
  return longestDelayFlight;
  }
void keyPressed() {
  if (keyCode == ENTER) {
    println(TB.Text);
    TB.selected = false;
    
    // LOGIC FOR SEARCHING STUFF IN THE SEARCH BAR SHOULD GO HERE
    if (TB.Text.equals("Longest Delay")) {
      DataPoint longestDelay = findLongestDelay(values);
      if (longestDelayFlight != null) {
        system.out.println("Date : " + longest.DelayFlight.FL_DATE);
        system.out.println("Carrier : " + longest.DelayFlight.FL_DATE);
        system.out.println("Flight No. : " + longest.DelayFlight.FL_DATE);
        system.out.println("Origin : " + longest.DelayFlight.FL_DATE);
        system.out.println("Destination : " + longest.DelayFlight.FL_DATE);
        int departureDelay = Integer.parseInt(longestDelayFlight.DEP_TIME) - Integer.parseInt(longestDelayFlight.CRS_DEP_TIME);
        int arrivalDelay = Integer.parseInt(longestDelayFlight.ARR_TIME) - Integer.parseInt(longestDelayFlight.CRS_ARR_TIME);
        int totalDelay = departureDelay - arrivalDelay;
        system.out.println(" Overall delay : " + totalDelay); 
        
    for (int j = 0; j < values.size(); j++) {  
      //ArrayList<Widget> airportNames = new ArrayList<Widget>();
      //print(displayData);
      
      for (int count = 0; count < values.size(); count++) {
        for (String element : displayData) {
          if (element.contains(TB.Text)) {
            System.out.println(element);
          }
        }
      }
    }
  }
  TB.KeyPressed(key, keyCode);
}
