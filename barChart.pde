class barChart {
  ArrayList<DataPoint> dataPoints;
  int[] data;

  // Modify the constructor to accept an ArrayList<DataPoint>
  barChart (ArrayList<DataPoint> dataPoints) {
    this.dataPoints = dataPoints;
    // Initialize the data array with the size of dataPoints
    this.data = new int[dataPoints.size()];
    // Fill the data array with the distance from each DataPoint
    for (int i = 0; i < dataPoints.size(); i++) {
      this.data[i] = dataPoints.get(i).distance; // Assuming DataPoint has a distance field
    }
  }

void barChartInitialise() {
  int numBars = data.length;
  int barWidth = width / numBars;
  for (int i = 0; i < numBars; i++) {
    float barHeight = map(data[i], 0, max(data), 0, height);
    float x = i * barWidth;
    float y = height - barHeight;
    fill(0, 150, 200);
    rect(x, y, barWidth, barHeight);
  }
}

}
