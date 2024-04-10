  // Group B Team 14 - Programming Project
  
  //Imports
  import processing.core.PImage;
  import java.util.ArrayList;
  import java.util.HashMap;
  import java.util.Map;
  import java.util.Map.*;
  import java.util.Set;
  
  //Global Variables
  boolean isLongestDelayAdded = false;
  boolean longestDelayBool = false;
  boolean flightsInRangeBool = false;
  
  String longestDelayInfo = "";
  int total;
  Table dataFile;
  PImage img;
  PFont stdFont;  
  
  String date1 = "";
  String date2 = "";
  int month1;
  int day1;
  int year1;
  int month2;
  int day2;
  int year2;
  int flightsInRange = 0;
  
  //Creating ArrayLists
  ArrayList<String> displayData;
  ArrayList<Widget> widgetList = new ArrayList<Widget>();
  ArrayList<DataPoint> values = new ArrayList<DataPoint>();
  
  //Instantiating Class Instances
  PieChart pieChart;
  LateFlights lateFlights;
  BusiestStates busiestStates;
 
  //Defining Button Events
  final int EVENT_BUTTONBUSIESTCITY=1;
  final int EVENT_BUTTONFLIGHTSTATUS=2;
  final int EVENT_BUTTONSEARCHBAR=3;
  final int EVENT_BACKWARD=4;
  final int EVENT_BUTTONLATEFLIGHT=5;
  final int EVENT_BUTTONBUSIESTSTATE=6;
  final int EVENT_BUTTONDATERANGE=7;
  final int EVENT_NULL=0;
  
  //Instantiating list of Screens
  Screen currentScreen, mainScreen, pieChartScreen, busiestCityScreen, 
  searchBarScreen, lateFlightScreen, busiestStateScreen, dateRangeScreen; 
  
  //Instantiating Search Bars
  Textbox TB;
  Textbox TBDateRange;
  
  void setup() {
    
    //Loading Data
    dataFile = loadTable("flights2k.csv");
    
    //Display Elements
    size(1280, 720);
    fileReader(dataFile);
    img = loadImage("backarrow.png");
    textAlign(LEFT);
    Widget busiestCity, flightStatus, searchBar, backwardsButton, lateFlight, busiestState, dateRange;
    PFont myFont = loadFont("AmericanTypewriter-12.vlw");
    PFont mainFont = loadFont("Arial-Black-80.vlw");
    
    //Creating Widgets for each Button
    busiestCity=new Widget(5, 5, 630, 233,
    "Busiest City", color(240, 120, 120), stdFont, EVENT_BUTTONBUSIESTCITY, true);
    flightStatus=new Widget(645, 5, 630, 233,
    "Flight Status", color(180, 60, 240), stdFont, EVENT_BUTTONFLIGHTSTATUS, true);
    searchBar=new Widget(5, 243, 630, 233,
    "Search Bar", color(250, 190, 0), stdFont, EVENT_BUTTONSEARCHBAR, true);
    backwardsButton=new Widget(0, 0, 53, 27,
    "", color(0, 200, 200), stdFont, EVENT_BACKWARD, true);
    lateFlight = new Widget(645, 243, 630, 233,
    "Late Flights", color(120, 120, 240), stdFont, EVENT_BUTTONLATEFLIGHT, true);
    busiestState = new Widget(5, 482, 630, 233,
    "Busiest States", color(250, 240, 120), stdFont, EVENT_BUTTONBUSIESTSTATE, true);
    dateRange = new Widget(645, 482, 630, 233,
    "Date Ranges", color(120, 240, 120), stdFont, EVENT_BUTTONDATERANGE, true);
    
    widgetList.add(busiestCity);
    widgetList.add(flightStatus);
    widgetList.add(lateFlight);
    widgetList.add(busiestState);
    widgetList.add(dateRange);
    
    //Creating Screens
    mainScreen = new Screen(color(150));
    pieChartScreen = new Screen(color(150));
    busiestCityScreen = new Screen(color(150));
    searchBarScreen = new Screen(color(150));
    lateFlightScreen = new Screen(color(150));
    busiestStateScreen = new Screen(color(150));
    dateRangeScreen = new Screen(color(150));
    
    //Adding Buttons to Screens
    mainScreen.add(busiestCity);
    mainScreen.add(flightStatus);
    mainScreen.add(searchBar);
    mainScreen.add(lateFlight);
    mainScreen.add(busiestState);
    mainScreen.add(dateRange);
    pieChartScreen.add(backwardsButton);
    searchBarScreen.add(backwardsButton);
    busiestCityScreen.add(backwardsButton);
    lateFlightScreen.add(backwardsButton);
    busiestStateScreen.add(backwardsButton);
    dateRangeScreen.add(backwardsButton);
    
    //Setting Screen to Main
    currentScreen = mainScreen;
    
    //Defining class instances
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
    //Setup UI fonts and colors
    background(0);
    PFont myFont = loadFont("Arial-Black-70.vlw");
    textFont(myFont);
    int margin = 0;
    
    //Set margins based on the amount of displayed data
    for (int i = 0; i < displayData.size(); i++) {
      text(displayData.get(i), 20, 20 + margin);
      margin += 20;
    }
    
    //Draw Current Screen
    currentScreen.draw();
    
    //Load extra elements based on current Screen
    
    //Main Screen
    if (currentScreen == mainScreen) {
      // Empty as not needed at the moment
    }
    
    //All Screens but Main
    if (currentScreen != mainScreen) {
      //Load Image for Back Arrow Button
      image(img, 0, 0);
    }
    
    //Busiest City Screen
    if (currentScreen == busiestCityScreen) {
       findBusiestCity();
    }
    
    //Flight Status Screen
    if (currentScreen == pieChartScreen) {
      //Display Pie Chart
      pieChart.draw();
    }
    
    //Search Bar Screen
    if (currentScreen == searchBarScreen) {
      //Display Search Bar
      textSize(25);
      fill(255);
      
      myFont = loadFont("Rockwell-40.vlw");
      
      textFont(myFont);
      text("Search Bar", 540, 140);
      
      TB.draw();
            
      //Displays Longest Delay result text/UI
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
    
    //Late Flights Screen
    if (currentScreen == lateFlightScreen) {
      // Display Data in a Bar Chart
      HashMap<String, Integer> stateCounts = lateFlights.stateCounts;
      int barWidth = (int)( width / stateCounts.size() / 1.15);
      int maxCount = 0;
      
      for (int count : stateCounts.values()) {
        if (count > maxCount) {
          maxCount = count;
        }
      }
      
      int x = 120;
      
      for (String state : stateCounts.keySet()) {
        int count = stateCounts.get(state);
        int barHeight = (int) map(count, 0, maxCount, 0, height/1.55);
        PFont font = loadFont("Rockwell-15.vlw");
        
        textFont(font); 
        fill(0, 150, 150);
        
        noStroke();
        rect(x, height - barHeight - 50, barWidth, barHeight);
        fill(0);
        
        textAlign(CENTER);
        text(state, x + barWidth / 2, height - 4  - 50);
        x += barWidth;
      }
      
      //Display text labels for the Bar Chart
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
        text("Amount of Late Flights", 0, 0);
      popMatrix();
      
      pushMatrix();
        for (int count = 0; count < 12 + 1; count++ ) {
          text(count, 95, 670 - 40 * count);
        }
      popMatrix();
      
      textAlign(LEFT);      
    }  
    
    //Busiest States Screen
    if (currentScreen == busiestStateScreen) {
      // Display Data in a Bar Chart
      HashMap<String, Integer> stateCounts = busiestStates.stateCounts;
      int barWidth = (int)( width / stateCounts.size() / 1.15);
      int maxCount = 0;
      
      for (int count : stateCounts.values()) {
        if (count > maxCount) {
          maxCount = count;
        }
      }
      
      int x = 120;
      
      for (String state : stateCounts.keySet()) {
        int count = stateCounts.get(state);
        int barHeight = (int) map(count, 0, maxCount, 0, height/1.55);
        PFont font = loadFont("Rockwell-15.vlw");
        
        textFont(font); 
        fill(155, 10, 10);
        
        noStroke();
        rect(x, height - barHeight - 50, barWidth, barHeight);
        fill(0);
        
        textAlign(CENTER);
        text(state, x + barWidth / 2, height - 4  - 50);
        x += barWidth;
      }
      
      //Display text labels for the Bar Chart
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
        text("Amount of Flights", 0, 0);
      popMatrix();
      
      pushMatrix();
        for (int count = 0; count < 12 + 1; count++ ) {
          text(count*48, 95, 670 - 40 * count);
        }
      popMatrix();
      
      textAlign(LEFT);      
    }  
    
    //Date Ranges Screen
    if (currentScreen == dateRangeScreen) {
      textSize(25);
      fill(255);
      myFont = loadFont("Rockwell-40.vlw");
      textFont(myFont);
      text("Search for Flights in Date Range", 350, 140);
      
      TBDateRange.draw();
      
      //Displays Flights in Range result text/UI
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

//Checks for when the mouse is pressed
void mousePressed() {
  
  //Changes screen based on which Button is pressed
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  
  //Busiest City Button
  case EVENT_BUTTONBUSIESTCITY:
    println("Busiest City"); 
    currentScreen = busiestCityScreen;
    break;
    
  //Search Bar Button
  case EVENT_BUTTONSEARCHBAR:
    println("Search Bar");
    currentScreen = searchBarScreen;
    break;
    
  //Flight Status Button
  case EVENT_BUTTONFLIGHTSTATUS:
    println("Flight Status");
    currentScreen = pieChartScreen;
    break;
    
  //Late Flights Button
  case EVENT_BUTTONLATEFLIGHT:
    println("Late Flights");
    currentScreen = lateFlightScreen;
    break;
    
  //Busiest States Button
  case EVENT_BUTTONBUSIESTSTATE:
    println("Busiest States");
    currentScreen = busiestStateScreen;
    break;
    
  //Date Ranges Button
  case EVENT_BUTTONDATERANGE:
    println("Date Ranges");
    currentScreen = dateRangeScreen;
    break;
    
  //Back Arrow Button
  case EVENT_BACKWARD:
    println("Backward");
    currentScreen = mainScreen;
    break;
  }
  
  //Tracks if the Search Bar is clicked on
  TB.pressed(mouseX, mouseY);
  TBDateRange.pressed(mouseX, mouseY);
  
}

//Checks for when the mouse moves
void mouseMoved() {
  currentScreen.mouseMoved();

  if (currentScreen == pieChartScreen || currentScreen == busiestCityScreen){
  image(img, 0, 0);

  }
}

//Reads data file and formats it as both instances of the DataPoint class and an ArrayList<String>
void fileReader(Table data) {

  //Counts the number of columns and rows
  int columns = data.getColumnCount();
  int rows = data.getRowCount();
  
  //Creates a new instance of DataPoint for each row and adds it to the list of values
  DataPoint newPoint;
  for (int i = 0; i < rows; i++) {
    newPoint = new DataPoint(data.getRow(i));
    values.add(newPoint);
  }

  //Defines the variables for each DataPoint
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

//Finds the longest flight delay of a given data input
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

//Checks for when a key is pressed
void keyPressed() {
  
  //Retrieves input for the Search Bar when ENTER is pressed (Search Bar Screen Version)
  if (keyCode == ENTER && currentScreen == searchBarScreen) {
    println(TB.Text);
    TB.selected = false;

    // Finds the longest flight delay in the list of data values
    if (TB.Text.equalsIgnoreCase("Longest Delay")) {
      DataPoint longestDelay = findLongestDelay(values);
      
      //Sets and Displays the result
      if (longestDelay != null) {
        longestDelayInfo = "Date: " + longestDelay.FL_DATE + "\n" +
                           longestDelay.MKT_CARRIER + "\n" +
                           "Overall Delay: " + 
                           (Integer.parseInt(longestDelay.DEP_TIME) - Integer.parseInt(longestDelay.CRS_DEP_TIME) +
                           Integer.parseInt(longestDelay.ARR_TIME) - Integer.parseInt(longestDelay.CRS_ARR_TIME)) + 
                           " minutes";
             
        longestDelayBool = true;
      }
    }
  }
  
  //Retrieves input for the Search Bar when ENTER is pressed (Date Range Screen Version)
  if (keyCode == ENTER && currentScreen == dateRangeScreen) {
       
       //Retrieves the first date entered
       if (date1 == "") {
         date1 = TBDateRange.Text;
       }
       
       //Retrieves the second date entered
       else if (date2 == "") {
         date2 = TBDateRange.Text;
       }
       
       //Finds flights within the range of the two given dates
       else {
         findFlightsInRange();
         
         //Displays the result
         flightsInRangeBool = true;
         
         //Clears the input dates
         date1 = "";
         date2 = "";
       }
  }
  
  //Tracks if keys are pressed when the Search Bar is selected
  TB.KeyPressed(key, keyCode);
  TBDateRange.KeyPressed(key, keyCode);
}

//Finds the busiest city in the data file
void findBusiestCity() {
    
    //Counts the number of times a city is listed as a flight destination
    String[] destCityArr = new String[values.size()];
      
    for (int count = 0; count < values.size(); count++) {
          destCityArr[count] = values.get(count).DEST_CITY_NAME;
    }
    
    //Resets max values
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
      
      //Resets max values
      maxStr = "";
      maxValue = 0;
      
      //Finds the city that is listed as a destination the most times
      for (Map.Entry<String,Integer> entry : frequency.entrySet()) {
        String key = entry.getKey();
        Integer count = entry.getValue();
          
        if (count > maxValue) { 
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
    
    //Displays the busiest city and number of flights
    PFont myFont = loadFont("Rockwell-40.vlw");
    textFont(myFont);
    
    textSize(25);
    
    text("Busiest City: " + maxStr, 400, 200+50);
    text("Number of Flights: " + maxValue, 400, 200+75);
} 

//Finds the number of flights within the range of two given dates
void findFlightsInRange() {     
     //Retrieves the month, day, and year of both entered dates
     month1 = Integer.parseInt(date1.substring(0, 2));
     day1 = Integer.parseInt(date1.substring(3, 5));
     year1 = Integer.parseInt(date1.substring(6, 10));
     
     month2 = Integer.parseInt(date2.substring(0, 2));
     day2 = Integer.parseInt(date2.substring(3, 5));
     year2 = Integer.parseInt(date2.substring(6, 10));
     
     //Retrieves the date of each flight in the data file
     for (int i = 1; i < values.size(); i++) {
       int currentMonth = Integer.parseInt(values.get(i).FL_DATE.substring(0, 2));
       int currentDay = Integer.parseInt(values.get(i).FL_DATE.substring(3, 5));
       int currentYear = Integer.parseInt(values.get(i).FL_DATE.substring(6, 10));
       
       //Checks if the date of a flight is within the range of the two dates entered
       if (
       (currentMonth >= month1 && currentMonth <= month2) && 
       (currentDay >= day1 && currentDay <= day2) && 
       (currentYear >= year1 && currentYear <= year2)
       ) {
         flightsInRange++;
       }  
     }
  }
