// Group B Team 14 - Programming Project
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.*;
import java.util.Set;

Table dataFile;
pieChart PieChart;
int total;
ArrayList<String> displayData; 
ArrayList<Widget> widgetList = new ArrayList<Widget>();
PFont stdFont;
final int EVENT_BUTTON1=1; final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3; final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;

Screen currentScreen, screen1, screen2, screen3;
Textbox TB;
//ArrayList<Textbox> textboxes = new ArrayList<Textbox>();
 ArrayList<DataPoint> values = new ArrayList<DataPoint>();
 
void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);

  /* read_in_the_file();
  result = default_query();
  current_query = query3; // whatever type of query is default */
  size(800,400);

 size(800,400);
  
  Widget widget1, widget2, widget3, widget4;
 PFont myFont = loadFont("AmericanTypewriter-12.vlw");
 textFont(myFont);
 
 widget1=new Widget(100, 100, 180, 40,
 "Button 1", color(200, 0, 0), stdFont, EVENT_BUTTON1);

 size(1280, 720);
 Widget widget1, widget2, widget3, widget4;
 PFont myFont = loadFont("GeorgiaPro-Semibold-15.vlw");
 textFont(myFont);
 widget1=new Widget(100, 100, 180, 40,
 "Busiest Destinations", color(200, 0, 0), stdFont, EVENT_BUTTON1);
 widget2=new Widget(100, 200, 180, 40,
 "Flights status", color(0, 200, 0), stdFont, EVENT_FORWARD);
 widget3=new Widget(100, 100, 180, 40,
 "Button 2", color(0,0,200), stdFont, EVENT_BUTTON2);
 widget4=new Widget(100, 200, 180, 40,
 "Backward", color(0,200,200), stdFont, EVENT_BACKWARD);

 //size(400, 400);
 
 widgetList.add(widget1);
 widgetList.add(widget2);

 screen1 = new Screen(color(70));
 screen2 = new Screen(color(150));

 screen3 = new Screen(color(255));

 screen1.add(widget1);
 screen1.add(widget2);
 screen2.add(widget3);
 screen2.add(widget4);
 
 currentScreen = screen1;


 screen3.add(widget4);
 currentScreen = screen1;
 
 PieChart = new pieChart();
 total = dataFile.getRowCount();
 //noStroke();
 stroke(0);
 PieChart.getData();
 noStroke();
 PieChart.getData();
 
 
 TB = new Textbox(540,  325,  35,  200);
 //textboxes.add(TB);

}

  void draw(){
    background(0);
    PFont myFont = loadFont("GeorgiaPro-Semibold-15.vlw");
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
   if(currentScreen == screen1)
   {
   TB.draw();
   }
   
   busiestRoutes();
  }
/*void draw() {

  


void mousePressed(){
 switch(currentScreen.getEvent(mouseX, mouseY)) {
 case EVENT_BUTTON1:
 println("Busiest Destinations!"); currentScreen = screen3;
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

 void mousePressed() {
  switch(event)
    case button 1:
      current_query = query1;
      results=query1();
      break;
    case button 2:
      current_query = query2;
      results=query2();
    Etc.
} */
 
    //fPFont myFont = loadFont("AmericanTypewriter-12.vlw");
    textFont(myFont);
    //int margin = 0;
    for (int i = 0; i < displayData.size(); i++) {
      text(displayData.get(i), 20, 20 + margin);
      println(displayData.get(i));
      margin += 20;
    }
  
    currentScreen.draw();
    
    if (currentScreen == screen2){
      PieChart.draw();
    }
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
void keyPressed() {
  if (keyCode == ENTER) {
    println(TB.Text);
    TB.selected = false;
    
    // LOGIC FOR SEARCHING STUFF IN THE SEARCH BAR SHOULD GO HERE
    for (int j = 0; j < values.size(); j++) {  
      
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

void busiestRoutes() {
    String[] destCityArr = new String[values.size()];
      for (int count = 0; count < values.size(); count++) {
            //fill(255);
            //text(values.get(count).DEST_CITY_NAME, 10, 10*count);
            destCityArr[count] = values.get(count).DEST_CITY_NAME;
      }
      String maxStr = " ";
      int maxValue = 0;
      Map<String,Integer> frequency = new HashMap<String, Integer>();
      for (String freq: destCityArr) {
        if (frequency.keySet().contains(freq)) {
          frequency.put(freq, frequency.get(freq) + 1); 
        }
        else {
          frequency.put(freq, 1);
        }
        maxStr = "";
        maxValue = 0;
        for (Map.Entry<String,Integer> entry : frequency.entrySet()) {
          String key = entry.getKey();
          Integer count = entry.getValue();
          if ( count > maxValue ) { 
            maxValue = count;
            maxStr = key;
          }
          else if (count == maxValue){ 
          if (key.length() < maxStr.length()) {
            maxStr = key; 
          }
      }
        }
        
        
        
      } 
      /*String maxStrArr[] = maxStr.split(" ");
      for (int count2 =0 ; count2 < maxStrArr.length; count2++) {
          text("Busiest Destination: " + maxStrArr[count2], 400, 10+11*count2);
      }*/
      if(currentScreen == screen3)
      {
      textSize(18);
      text("Busiest Destination: " + maxStr, 400, 10+11);
      text("Amount of flights: " + maxValue, 400, 10+30);
      }
}
