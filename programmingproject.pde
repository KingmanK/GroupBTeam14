// Group B Team 14 - Programming Project

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
  
  for (int i = 0; i < rows; i++) {
      System.out.println("");
    for (int j = 0; j < columns; j++) {
      System.out.print(data.getString(i, j) + " ");  
    }
  }
}
