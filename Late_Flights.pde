class LateFlights {
  Table data;
  HashMap<String, Integer> airportCounts;

  LateFlights(Table data) {
    this.data = data;
    airportCounts = new HashMap<>();
    calculateAirportCounts();
  }

  void calculateAirportCounts() {
    for (TableRow row : data.rows()) {
      String lateFlights = row.getString(16);
      String name;
      if (lateFlights.equals("1") ) {
              name = row.getString(9);
              updateAirportCount(name);              
      }
      
      
      //updateAirportCount(lateFlights);
      
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
