class PieChart {
  
  //Initializes pie chart variables
  int diverted = 0;
  int cancelled = 0;
  int onTime = 0;
  double[] angles = new double[3];
  
  void draw() {
    //Creates pie chart text
    PFont pieFont = loadFont("AmericanTypewriter-28.vlw");
    //textSize(28);

    textFont(pieFont);
    textSize(28);
    calculateAngles();
    pie_chart(250, angles);
    fill(245);
    text((nf(((float)onTime/total)*100,0,2)) + "% of flights are on time ", 445, 375);
    text((nf(((float)cancelled/total)*100,0,2)) + "% of flights have been cancelled ", 445, 415);
    text("<0.01% of flights have been diverted ", 445, 455);
  }
  
  //Retrievs pie chart data
  void getData() {
    for (int i = 1; i < dataFile.getRowCount(); i++) {
      TableRow row = dataFile.getRow(i);
      
      //Checks if a flight was cancelled
      if (Integer.parseInt(row.getString(16)) == 1) {
        cancelled++;
      }
      //Checks if a flight was diverted
      if(Integer.parseInt(row.getString(17)) == 2) {
        diverted++;
      }
    }
    //Calculates number of on time flights
    onTime = total - (cancelled+diverted);
  }
  
  //Calculates the angles of the pie chart slices
  void calculateAngles() {
    double cancelledAngle = (double)cancelled/total * 360;
    double divertedAngle = (double)diverted/total * 360;
    double onTimeAngle = (double)onTime/total * 360;
    
    angles[0] = cancelledAngle;
    angles[1] = divertedAngle;
    angles[2] = onTimeAngle;
  }

  //Creates a pie chart out of a given diameter and data input
  void pie_chart(float diameter, double[] data) {
    float lastAngle = 0;
    
    for (int i = 0; i < data.length; i++) {
      float gray = map(i, 0, data.length, 0, 255);
      fill(gray);
      noStroke();
      arc(580, 450-diameter, diameter, diameter, lastAngle, lastAngle+radians((float)data[i]));
      lastAngle += radians((float)data[i]);
    }
  }   
}
