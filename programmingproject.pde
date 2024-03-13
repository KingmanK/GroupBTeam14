// Group B Team 14 - Programming Project
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;

void setup() {
 fileReader();
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
ArrayList<String> readData(BufferedReader bufferedReader) {
  ArrayList<String> flightData = new ArrayList<String>();
      
      String line;
      
      try {
        while((line = bufferedReader.readLine()) != null) {
          flightData.add(line);
        }
      }
      catch (IOException e) {
        e.printStackTrace();
      }
      finally {
          try {
            bufferedReader.close();
          }
          catch (IOException e) {
            e.printStackTrace();
          }
      }
      
      return flightData;
}

void fileReader() {
  File dataFile = new File ("flights2k.csv");
      ArrayList<String> flightList = null;
  try (BufferedReader bufferedReader = new BufferedReader(new FileReader(dataFile))) {
        flightList = readData(bufferedReader);
  }
  catch (IOException e) {
        e.printStackTrace();
  }
  
  for (int i = 0; i < flightList.size(); i++) {
    println(flightList.get(i));
  }
}
