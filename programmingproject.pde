// Group B Team 14 - Programming Project
import java.util.ArrayList;

Table dataFile;
ArrayList<String> displayData; 


void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);
  /* read_in_the_file();
  result = default_query();
  current_query = query3; // whatever type of query is default */
  size(800,400);
}

  void draw(){
    background(0);
  PFont myFont = loadFont("AmericanTypewriter-12.vlw");
  textFont(myFont);
  int margin = 0;
  for (int i = 0; i < displayData.size(); i++) {
    text(displayData.get(i), 20, 20 + margin);
    println(displayData.get(i));
    margin += 20;
  }
  }
/*void draw() {
  
  switch(current_query){
    case query1:
      render_query1(results);
      break;
    //case query2:
      //Etc….. 
  } 
  render_controls();
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
