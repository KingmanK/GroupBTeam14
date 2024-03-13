// Group B Team 14 - Programming Project
import java.util.ArrayList;

Table dataFile;

void setup() {
 dataFile = loadTable("flights2k.csv");
 fileReader(dataFile);
  /* read_in_the_file();
  result = default_query();
  current_query = query3; // whatever type of query is default */
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
     
     for (int j = 0; j < values.size(); j++) {
       
        System.out.print(values.get(j).FL_DATE + " ");
        System.out.print(values.get(j).MKT_CARRIER + " ");
        System.out.print(values.get(j).MKT_CARRIER_FL_NUM + " ");
        System.out.print(values.get(j).ORIGIN + " ");
        System.out.print(values.get(j).ORIGIN_CITY_NAME + " ");
        System.out.print(values.get(j).ORIGIN_STATE_ABR + " ");
        System.out.print(values.get(j).ORIGIN_WAC + " ");
        System.out.print(values.get(j).DEST + " ");
        System.out.print(values.get(j).DEST_CITY_NAME + " ");
        System.out.print(values.get(j).DEST_WAC + " ");
        System.out.print(values.get(j).CRS_DEP_TIME + " ");
        System.out.print(values.get(j).DEP_TIME + " ");
        System.out.print(values.get(j).CRS_ARR_TIME + " ");
        System.out.print(values.get(j).ARR_TIME + " ");
        System.out.print(values.get(j).CANCELLED + " ");
        System.out.print(values.get(j).DIVERTED + " ");
        System.out.print(values.get(j).DISTANCE + "\n");
     
     }
}
