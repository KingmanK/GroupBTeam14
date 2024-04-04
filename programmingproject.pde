// Group B Team 14 - Programming Project
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.*;
import java.util.Set;

Table dataFile;
PImage img;
pieChart PieChart;
int total;
ArrayList<String> displayData;
ArrayList<Widget> widgetList = new ArrayList<Widget>();
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3;
final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2, screen3, screen4;
Textbox TB;
//ArrayList<Textbox> textboxes = new ArrayList<Textbox>();
ArrayList<DataPoint> values = new ArrayList<DataPoint>();

void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);
 size(1280, 720);
 img = loadImage("backarrow.png");
 Widget widget1, widget2, widget3, widget4;
 PFont myFont = loadFont("AmericanTypewriter-12.vlw");
 textFont(myFont);
 widget1=new Widget(350, 340, 180, 40,
 "Busiest Destinations", color(240, 120, 120), stdFont, EVENT_BUTTON1);
 widget2=new Widget(550, 340, 180, 40,
 "Flight Status", color(120, 240, 120), stdFont, EVENT_FORWARD);
 widget3=new Widget(750, 340, 180, 40,
 "Search Bar", color(120, 120, 240), stdFont, EVENT_BUTTON2);
 widget4=new Widget(0, 0, 53, 27,
 "<---", color(0, 200, 200), stdFont, EVENT_BACKWARD);
 
 widgetList.add(widget1);
 widgetList.add(widget2);

 screen1 = new Screen(color(150));
 screen2 = new Screen(color(150));
 screen3 = new Screen(color(150));
 screen4 = new Screen(color(150));

 screen1.add(widget1);
 screen1.add(widget2);
 screen1.add(widget3);
 screen2.add(widget4);
 screen3.add(widget4);
 screen4.add(widget4);
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

  if (currentScreen == screen2) {
    PieChart.draw();
  }
  
  if (currentScreen == screen2 || currentScreen == screen3){
  image(img, 0, 0);
  }

  /*for (Textbox t : textboxes) {
   t.DRAW();
   }*/
  if (currentScreen == screen4) {
    textSize(25);
    fill(255);
    text("Search bar", 570, 140);
    TB.draw();
  }
  
  busiestRoutes();
}



void mousePressed() {
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_BUTTON1:
    println("Busiest Destinations!"); 
    currentScreen = screen3;
    break;
  case EVENT_BUTTON2:
    println("Search Bar");
    currentScreen = screen4;
    break;
  case EVENT_FORWARD:
    println("Flight Status");
    currentScreen = screen2;
    break;
  case EVENT_BACKWARD:
    println("Backward");
    currentScreen = screen1;
    break;
  }

  /* for (Textbox t : textboxes) {
   t.pressed(mouseX, mouseY);
   }*/

  TB.pressed(mouseX, mouseY);
}


void mouseMoved() {
  currentScreen.mouseMoved();
  if (currentScreen == screen2 || currentScreen == screen3){
  image(img, 0, 0);
  }
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
    System.out.println("DEP_TIME: " + flight.DEP_TIME + ", CRS_DEP_TIME: " + flight.CRS_DEP_TIME); 
    try {
      int depDelay = Integer.parseInt(flight.CRS_DEP_TIME) - Integer.parseInt(flight.DEP_TIME);
      int arrDelay = Integer.parseInt(flight.CRS_ARR_TIME) - Integer.parseInt(flight.ARR_TIME);
      int totalDelay = depDelay + arrDelay;
      
      if (totalDelay > longestDelay) {
        longestDelay = totalDelay;
        longestDelayFlight = flight;
      }
    } catch (NumberFormatException e) {
      println("NumberFormatException occurred: " + e.getMessage()); 
    }
  }
  return longestDelayFlight;
}
 
void keyPressed() {
  if (keyCode == ENTER) {
    println(TB.Text);
    TB.selected = false;

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

   // LOGIC FOR SEARCHING STUFF IN THE SEARCH BAR SHOULD GO HERE
    if (TB.Text.equals("Longest Delay")) {
      DataPoint longestDelay = findLongestDelay(values);
      if (longestDelay != null) {
        if (currentScreen == screen1) {
        text("Date : " + longestDelay.FL_DATE, 100, 400);
        println("Carrier : " + longestDelay.MKT_CARRIER);
        println("Flight No. : " + longestDelay.MKT_CARRIER_FL_NUM);
        println("Origin : " + longestDelay.ORIGIN);
        println("Destination : " + longestDelay.DEST);
        int departureDelay = Integer.parseInt(longestDelay.DEP_TIME) - Integer.parseInt(longestDelay.CRS_DEP_TIME);
        int arrivalDelay = Integer.parseInt(longestDelay.ARR_TIME) - Integer.parseInt(longestDelay.CRS_ARR_TIME);
        int totalDelay = departureDelay - arrivalDelay;
        println(" Overall delay : 43 minutes");
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
