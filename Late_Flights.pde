class LateFlights {
  Table data;
  HashMap<String, Integer> stateCounts;

  //Initializes data file and calls methods 
  LateFlights(Table data) {
    this.data = data;
    stateCounts = new HashMap<>();
    calculateStateCounts();
  }
  
  //Calculates the number of times a state has a delayed flight
  void calculateStateCounts() {
    for (TableRow row : data.rows()) {
      
      //Finds the DIVERTED value of a DataPoint
      String lateFlights = row.getString(16);
      
      //Checks if DIVERTED is true
      if (lateFlights.equals("1") ) {
              //If so, adds the DataPoint to the state count
              updateStateCount(row.getString(9));              
      }
    }
  }
  
  //Updates the state count with a given value
  void updateStateCount(String state) {
    if (stateCounts.containsKey(state)) {
      int count = stateCounts.get(state);
      stateCounts.put(state, count + 1);
    } 
    
    else {
      stateCounts.put(state, 1);
    }
  }
}
