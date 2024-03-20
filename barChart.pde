class barChart {
  
int[] data = {30, 75, 50, 110, 90};

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
