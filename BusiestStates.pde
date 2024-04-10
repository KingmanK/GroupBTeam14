class BusiestStates {
  Table data;
  HashMap<String, Integer> stateCounts;
  
  //Initializes data file and calls methods 
  BusiestStates(Table data) {
    this.data = data;
    stateCounts = new HashMap<>();
    calculateStateCounts();
  }
  
  //Calculates the number of times a state is listed as a destination or point of origin
  void calculateStateCounts() {
    for (TableRow row : data.rows()) {
      
      //Retrieves state abreviations for the desination and point of origin in a given data point
      String DEST_STATE_ABR = row.getString(5);
      String ORIGIN_STATE_ABR = row.getString(9);

      //Updates the state count with these values
      updateStateCount(ORIGIN_STATE_ABR);              
      updateStateCount(DEST_STATE_ABR);
      
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
  
  //Finds the busiest state in the data file
  String findMostPopularState() {
    
    String mostPopularState = "";
    int maxCount = 0;
    
    for (String state : stateCounts.keySet()) {
      
      int count = stateCounts.get(state);
      
      if (count > maxCount) {
        mostPopularState = state;
        maxCount = count;
      }
    }
    return mostPopularState;
  }
}
