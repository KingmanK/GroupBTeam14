class BusiestStates {
  Table data;
  HashMap<String, Integer> airportCounts;

  BusiestStates(Table data) {
    this.data = data;
    airportCounts = new HashMap<>();
    calculateAirportCounts();
  }

  void calculateAirportCounts() {
    for (TableRow row : data.rows()) {
      
      String DEST_STATE_ABR = row.getString(5);
      String ORIGIN_STATE_ABR = row.getString(9);

      updateAirportCount(ORIGIN_STATE_ABR);              
      updateAirportCount(DEST_STATE_ABR);
      
    }
  }

  void updateAirportCount(String airport) {
    if (airportCounts.containsKey(airport)) {
      int count = airportCounts.get(airport);
      airportCounts.put(airport, count + 1);
    } else {
      airportCounts.put(airport, 1);
    }
  }

  String findMostPopularAirport() {
    String mostPopularAirport = "";
    int maxCount = 0;
    for (String airport : airportCounts.keySet()) {
      int count = airportCounts.get(airport);
      if (count > maxCount) {
        mostPopularAirport = airport;
        maxCount = count;
      }
    }
    return mostPopularAirport;
  }
}
