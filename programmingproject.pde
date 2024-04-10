  // Group B Team 14 - Programming Project
  import processing.core.PImage;
  import java.util.ArrayList;
  import java.util.HashMap;
  import java.util.Map;
  import java.util.Map.*;
  import java.util.Set;
  
  boolean isLongestDelayAdded = false;
  boolean longestDelayBool = false;
  String longestDelayInfo = "";
  Table dataFile;
  PImage img;
  
  pieChart PieChart;
  BusiestAirports busiestAirports;
  
  int total;
  ArrayList<String> displayData;
  ArrayList<Widget> widgetList = new ArrayList<Widget>();
  PFont stdFont;
  final int EVENT_BUTTON1=1;
  final int EVENT_FORWARD=2;
  final int EVENT_BUTTON2=3;
  final int EVENT_BACKWARD=4;
  final int EVENT_BUTTONBUSIESTAIRPORT=5;
  final int EVENT_NULL=0;
  Screen currentScreen, mainScreen, pieChartScreen, busiestDestinationScreen, searchBarScreen, busiestAirportScreen;
  Textbox TB;
  ArrayList<DataPoint> values = new ArrayList<DataPoint>();
  
  void setup() {
   size(1280, 720);
    
   dataFile = loadTable("flights2k.csv");
   fileReader(dataFile);
   
   img = loadImage("backarrow.png");
  
   Widget busiestDestinations, flightStatus, searchBar, backwardsButton, busiestAirport;
   PFont myFont = loadFont("AmericanTypewriter-12.vlw");
   textFont(myFont);
   busiestDestinations=new Widget(350, 340, 180, 40,
   "Busiest Destinations", color(240, 120, 120), stdFont, EVENT_BUTTON1, true);
   flightStatus=new Widget(550, 340, 180, 40,
   "Flight Status", color(120, 240, 120), stdFont, EVENT_FORWARD, true);
   searchBar=new Widget(750, 340, 180, 40,
   "Search Bar", color(120, 120, 240), stdFont, EVENT_BUTTON2, true);
   backwardsButton=new Widget(0, 0, 53, 27,
   "", color(0, 200, 200), stdFont, EVENT_BACKWARD, true);
   busiestAirport = new Widget(150, 340, 180, 40,
   "Busiest Airport", color(250, 240, 120), stdFont, EVENT_BUTTONBUSIESTAIRPORT, true);
  
   widgetList.add(busiestDestinations);
   widgetList.add(flightStatus);
   widgetList.add(busiestAirport);

   mainScreen = new Screen(color(150));
   pieChartScreen = new Screen(color(150));
   busiestDestinationScreen = new Screen(color(150));
   searchBarScreen = new Screen(color(150));
   busiestAirportScreen = new Screen(color(150));
  
   mainScreen.add(busiestDestinations);
   mainScreen.add(flightStatus);
   mainScreen.add(searchBar);
   mainScreen.add(busiestAirport);
   pieChartScreen.add(backwardsButton);
   searchBarScreen.add(backwardsButton);
   busiestDestinationScreen.add(backwardsButton);
   busiestAirportScreen.add(backwardsButton);
   currentScreen = mainScreen;

   PieChart = new pieChart();
   total = dataFile.getRowCount();
   noStroke();
   PieChart.getData();

   TB = new Textbox(540,  325,  35,  200);
   //textboxes.add(TB);
  
  // DataPoint longestDelay = findLongestDelay(values);
    Table data = loadTable("flights2k.csv", "header");
    busiestAirports = new BusiestAirports(data);
  }
  
  void draw(){
     background(0);
     PFont myFont = loadFont("Rockwell-15.vlw");
    textFont(myFont);
    int margin = 0;
    for (int i = 0; i < displayData.size(); i++) {
      text(displayData.get(i), 20, 20 + margin);
      //println(displayData.get(i));
      margin += 20;
    }
  
    currentScreen.draw();
    if (currentScreen == mainScreen) {
      myFont = loadFont("Rockwell-15.vlw");
      textAlign(LEFT);
      textFont(myFont);
    }
    if (currentScreen == pieChartScreen) {
      PieChart.draw();
    }
    if (currentScreen == pieChartScreen || currentScreen == busiestDestinationScreen ||currentScreen == busiestAirportScreen
    ||currentScreen == searchBarScreen) {
  
      image(img, 0, 0);
    }
  
    /*for (Textbox t : textboxes) {
     t.DRAW();
     }*/
  
    if (currentScreen == searchBarScreen) {
      textSize(25);
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
      textFont(myFont);
      text("Search Bar", 540, 140);
      TB.draw();
    }  
     if (currentScreen == busiestAirportScreen) {
       ////////////////////////////////// BAR CHART
      HashMap<String, Integer> airportCounts = busiestAirports.airportCounts;
  
      int barWidth = (int)( width / airportCounts.size() / 1.15);
      int maxCount = 0;
  
      for (int count : airportCounts.values()) {
        if (count > maxCount) {
          maxCount = count;
        }
      }
  
      int x = 120;
      for (String airport : airportCounts.keySet()) {
        int count = airportCounts.get(airport);
        int barHeight = (int) map(count, 0, maxCount, 0, height/1.55);
  
        fill(0, 150, 150);
        noStroke();
        rect(x, height - barHeight - 50, barWidth, barHeight);
  
        fill(0);
        textAlign(CENTER);
        text(airport, x + barWidth / 2, height - 4  - 50);
  
        x += barWidth;
      }
      
      myFont = loadFont("Rockwell-40.vlw"); 
      textFont(myFont);
      textSize(60);
      text("Amount of Flights per Airport (Arr & Dest)", 660, 100);
      
      textSize(30);
      text("Airport Name", 660, 700);
      
      rotate(90);  
      text("Amount of Flights", 20, 360);
      rotate(90); 
     
     
    }  
  busiestRoutes();  
if (currentScreen == searchBarScreen) {
  textSize(25);
  fill(255);
  myFont = loadFont("Rockwell-40.vlw");
  textFont(myFont);
  text("Search Bar", 540, 140);
  TB.draw();

  if (longestDelayBool) {
    fill(255);
    
    myFont = loadFont("Rockwell-40.vlw");
    
    if (TB.Text.equals("Longest Delay")) {
      textSize(25);
      fill(0);
      rect(400, 400, 500, 200);
      fill(255);
      textFont(myFont);
      textSize(25);
      text(longestDelayInfo, 500, 500);
    }
  }
}  
}
void mousePressed() {
   //scrollingList.mousePressed();
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_BUTTON1:
    println("Busiest Destinations!"); 
    currentScreen = busiestDestinationScreen;
    break;
  case EVENT_BUTTON2:
    println("Search Bar");
    currentScreen = searchBarScreen;
    break;
  case EVENT_FORWARD:
    println("Flight Status");
    currentScreen = pieChartScreen;
    break;
  case EVENT_BUTTONBUSIESTAIRPORT:
    println("Busiest Airport");
    currentScreen = busiestAirportScreen;
    break;
  case EVENT_BACKWARD:
    println("Backward");
    currentScreen = mainScreen;
    break;
  }

  /* for (Textbox t : textboxes) {
   t.pressed(mouseX, mouseY);
   }*/

  TB.pressed(mouseX, mouseY);
  
}


void mouseMoved() {
  currentScreen.mouseMoved();

  if (currentScreen == pieChartScreen || currentScreen == busiestDestinationScreen){
  image(img, 0, 0);

  }
}
void fileReader(Table data) {

  int columns = data.getColumnCount();
  int rows = data.getRowCount();
  DataPoint newPoint;
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
    try {
      int depDelay = Integer.parseInt(flight.CRS_DEP_TIME) - Integer.parseInt(flight.DEP_TIME);
      int arrDelay = Integer.parseInt(flight.CRS_ARR_TIME) - Integer.parseInt(flight.ARR_TIME);
      int totalDelay = depDelay + arrDelay;

      if (totalDelay > longestDelay) {
        longestDelay = totalDelay;
        longestDelayFlight = flight;
      }
    } catch (NumberFormatException e) {
      println("");
    }
  }
  return longestDelayFlight;
}
 
void keyPressed() {
  if (keyCode == ENTER) {
    // Basic Functionality for Search Bar
    println(TB.Text);
    TB.selected = false;
    String searchText = TB.Text;

    // Functionality for Longest Delay
    if (TB.Text.equalsIgnoreCase("Longest Delay")) {
      DataPoint longestDelay = findLongestDelay(values);
      if (longestDelay != null) {
        longestDelayInfo = "Date: " + longestDelay.FL_DATE + "\n" +
                           longestDelay.MKT_CARRIER + "\n" +
                           "Overall Delay: " + (Integer.parseInt(longestDelay.DEP_TIME) - Integer.parseInt(longestDelay.CRS_DEP_TIME) +
                                               Integer.parseInt(longestDelay.ARR_TIME) - Integer.parseInt(longestDelay.CRS_ARR_TIME)) + " minutes";
        longestDelayBool = true;
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
      if(currentScreen == busiestDestinationScreen)
      {
        PFont myFont = loadFont("Rockwell-40.vlw");
        textFont(myFont);
        textSize(25);
        text("Busiest Destination: " + maxStr, 400, 200+50);
        text("Amount of flights: " + maxValue, 400, 200+75);
      }
   } 
