  // Group B Team 14 - Programming Project
  import processing.core.PImage;
  import java.util.ArrayList;
  import java.util.HashMap;
  import java.util.Map;
  import java.util.Map.*;
  import java.util.Set;
  
  boolean isLongestDelayAdded = false;
  boolean longestDelayBool = false;
  boolean flightsInRangeBool = false;
  String date1 = "";
  String date2 = "";
  int month1;
  int day1;
  int year1;
  int month2;
  int day2;
  int year2;
  int flightsInRange = 0;
  String longestDelayInfo = "";
  Table dataFile;
  PImage img;
  
  PieChart pieChart;
  LateFlights lateFlights;
  BusiestStates busiestStates;
  int total;
  ArrayList<String> displayData;
  ArrayList<Widget> widgetList = new ArrayList<Widget>();
  PFont stdFont;
  final int EVENT_BUTTON1=1;
  final int EVENT_FORWARD=2;
  final int EVENT_BUTTON2=3;
  final int EVENT_BACKWARD=4;
  final int EVENT_BUTTONLATEFLIGHT=5;
  final int EVENT_BUTTONBUSIESTSTATE=6;
  final int EVENT_BUTTONDATERANGE=7;
  final int EVENT_NULL=0;
  Screen currentScreen, mainScreen, pieChartScreen, busiestDestinationScreen, 
  searchBarScreen, lateFlightScreen, busiestStateScreen, dateRangeScreen; 
  Textbox TB;
  Textbox TBDateRange;
  ArrayList<DataPoint> values = new ArrayList<DataPoint>();
  
  void setup() {
    size(1280, 720);
    dataFile = loadTable("flights2k.csv");
    fileReader(dataFile);
    img = loadImage("backarrow.png");
    textAlign(LEFT);
    Widget busiestDestinations, flightStatus, searchBar, backwardsButton, lateFlight, busiestState, dateRange;
    PFont myFont = loadFont("AmericanTypewriter-12.vlw");
    PFont mainFont = loadFont("Arial-Black-80.vlw");
    busiestDestinations=new Widget(5, 5, 630, 233,
    "Busiest City", color(240, 120, 120), stdFont, EVENT_BUTTON1, true);
    flightStatus=new Widget(645, 5, 630, 233,
    "Flight Status", color(180, 60, 240), stdFont, EVENT_FORWARD, true);
    searchBar=new Widget(5, 243, 630, 233,
    "Search Bar", color(250, 190, 0), stdFont, EVENT_BUTTON2, true);
    backwardsButton=new Widget(0, 0, 53, 27,
    "", color(0, 200, 200), stdFont, EVENT_BACKWARD, true);
    lateFlight = new Widget(645, 243, 630, 233,
    "Late Flights", color(120, 120, 240), stdFont, EVENT_BUTTONLATEFLIGHT, true);
    busiestState = new Widget(5, 482, 630, 233,
    "Busiest States", color(250, 240, 120), stdFont, EVENT_BUTTONBUSIESTSTATE, true);
    dateRange = new Widget(645, 482, 630, 233,
    "Date Ranges", color(120, 240, 120), stdFont, EVENT_BUTTONDATERANGE, true);
    widgetList.add(busiestDestinations);
    widgetList.add(flightStatus);
    widgetList.add(lateFlight);
    widgetList.add(busiestState);
    widgetList.add(dateRange);
    mainScreen = new Screen(color(150));
    pieChartScreen = new Screen(color(150));
    busiestDestinationScreen = new Screen(color(150));
    searchBarScreen = new Screen(color(150));
    lateFlightScreen = new Screen(color(150));
    busiestStateScreen = new Screen(color(150));
    dateRangeScreen = new Screen(color(150));
    mainScreen.add(busiestDestinations);
    mainScreen.add(flightStatus);
    mainScreen.add(searchBar);
    mainScreen.add(lateFlight);
    mainScreen.add(busiestState);
    mainScreen.add(dateRange);
    pieChartScreen.add(backwardsButton);
    searchBarScreen.add(backwardsButton);
    busiestDestinationScreen.add(backwardsButton);
    lateFlightScreen.add(backwardsButton);
    busiestStateScreen.add(backwardsButton);
    dateRangeScreen.add(backwardsButton);
    currentScreen = mainScreen;
    pieChart = new PieChart();
    total = dataFile.getRowCount();
    noStroke();
    pieChart.getData();
    TB = new Textbox(540,  325,  35,  200);
    TBDateRange = new Textbox(540,  325,  35,  200);
    Table data = loadTable("flights2k.csv", "header");
    lateFlights = new LateFlights(data);
    busiestStates = new BusiestStates(data);
  }
  
  void draw(){
    background(0);
    PFont myFont = loadFont("Arial-Black-70.vlw");
    textFont(myFont);
    int margin = 0;
    for (int i = 0; i < displayData.size(); i++) {
      text(displayData.get(i), 20, 20 + margin);
      margin += 20;
    }
    currentScreen.draw();
    if (currentScreen == mainScreen) {
    // Empty as not needed at the moment
    }
    if (currentScreen == pieChartScreen) {
      pieChart.draw();
    }
    if (currentScreen == pieChartScreen || currentScreen == busiestDestinationScreen 
    || currentScreen == lateFlightScreen ||currentScreen == searchBarScreen || currentScreen == busiestStateScreen || currentScreen == dateRangeScreen) {
      image(img, 0, 0); // Image for backspace
    }
    if (currentScreen == searchBarScreen) {
      textSize(25);
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
      
      textFont(myFont);
      text("Search Bar", 540, 140);
      TB.draw();
    }  
    if (currentScreen == dateRangeScreen) {
      textSize(25);
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
      
      textFont(myFont);
      text("Search for Flights in Date Range", 350, 140);
      TBDateRange.draw();
    }  
    if (currentScreen == lateFlightScreen) {
    // Logic for getting data to bar chart
      HashMap<String, Integer> airportCounts = lateFlights.airportCounts;
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
        PFont font = loadFont("Rockwell-15.vlw");
        textFont(font); 
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
      text("Late Flights", 660, 100);
      textSize(30);
      text("State Name", 660, 700);
      rect(120, 670, 4, -500);
      pushMatrix();
      float angle1 = radians(-90);
      translate(50, 400);
      rotate(angle1);
      text("Number of Late Flights", 0, 0);
      popMatrix();
      pushMatrix();
      for (int count = 0; count < 12 + 1; count++ ) {
        text(count, 95, 670 - 40 * count);
      }
      popMatrix();
      textAlign(LEFT);      
    }  
    if (currentScreen == busiestStateScreen) {
    // Logic for getting data to bar chart
      HashMap<String, Integer> airportCounts = busiestStates.airportCounts;
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
        PFont font = loadFont("Rockwell-15.vlw");
        textFont(font); 
        fill(155, 10, 10);
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
      text("Busiest States", 660, 100);
      textSize(30);
      text("State Name", 660, 700);
      rect(120, 670, 4, -500);
      pushMatrix();
      float angle1 = radians(-90);
      translate(50, 400);
      rotate(angle1);
      text("Number of Flights", 0, 0);
      popMatrix();
      pushMatrix();
      for (int count = 0; count < 12 + 1; count++ ) {
        text(count*48, 95, 670 - 40 * count);
      }
      popMatrix();
      textAlign(LEFT);      
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
    if (currentScreen == dateRangeScreen) {
      textSize(25);
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
      textFont(myFont);
      TBDateRange.draw();
    if (flightsInRangeBool) {
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
        textSize(25);
        fill(0);
        rect(400, 400, 500, 200);
        fill(255);
        textFont(myFont);
        textSize(25);
        text("Flights in Date Range: " + flightsInRange, 500, 500);
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
  case EVENT_BUTTONLATEFLIGHT:
    println("Late Flights");
    currentScreen = lateFlightScreen;
    break;
  case EVENT_BUTTONBUSIESTSTATE:
    println("Busiest States");
    currentScreen = busiestStateScreen;
    break;
  case EVENT_BUTTONDATERANGE:
    println("Date Ranges");
    currentScreen = dateRangeScreen;
    break;
  case EVENT_BACKWARD:
    println("Backward");
    currentScreen = mainScreen;
    break;
  }
  TB.pressed(mouseX, mouseY);
  TBDateRange.pressed(mouseX, mouseY);
  
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
  if (keyCode == ENTER && currentScreen == searchBarScreen) {
    // Basic Functionality for Search Bar
    println(TB.Text);
    TB.selected = false;

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
  if (keyCode == ENTER && currentScreen == dateRangeScreen) {
       
       if (date1 == "") {
         date1 = TBDateRange.Text;
       }
       else if (date2 == "") {
         date2 = TBDateRange.Text;
       }
       else {
         findFlightsInRange();
         println("Flights in Date Range: " + flightsInRange);
         flightsInRangeBool = true;
         
         date1 = "";
         date2 = "";
       }
  }
  TB.KeyPressed(key, keyCode);
  TBDateRange.KeyPressed(key, keyCode);
}
   void busiestRoutes() {
    String[] destCityArr = new String[values.size()];
      for (int count = 0; count < values.size(); count++) {
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
        textSize(40);
        text("Busiest City", 480, 150);
        textSize(25);
        text("Busiest Destination: " + maxStr, 430, 200+50);
        text("Number of flights: " + maxValue, 430, 200+75);
      }
   } 
   
   void findFlightsInRange() {
     month1 = Integer.parseInt(date1.substring(0, 2));
     day1 = Integer.parseInt(date1.substring(3, 5));
     year1 = Integer.parseInt(date1.substring(6, 10));
     
     month2 = Integer.parseInt(date2.substring(0, 2));
     day2 = Integer.parseInt(date2.substring(3, 5));
     year2 = Integer.parseInt(date2.substring(6, 10));
         
     for (int i = 1; i < values.size(); i++) {
       int currentMonth = Integer.parseInt(values.get(i).FL_DATE.substring(0, 2));
       int currentDay = Integer.parseInt(values.get(i).FL_DATE.substring(3, 5));
       int currentYear = Integer.parseInt(values.get(i).FL_DATE.substring(6, 10));
       
       if (
       (currentMonth >= month1 && currentMonth <= month2) && 
       (currentDay >= day1 && currentDay <= day2) && 
       (currentYear >= year1 && currentYear <= year2)
       ) {
         flightsInRange++;
         }
       }
  }
