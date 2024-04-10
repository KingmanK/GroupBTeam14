class Date_Range{
  
  int month1;
  int day1;
  int year1;
  
  int month2;
  int day2;
  int year2;
  
  int flightsInRange = 0;
  
  Date_Range(String date1, String date2) {
     month1 = Integer.parseInt(date1.substring(0, 2));
     day1 = Integer.parseInt(date1.substring(3, 5));
     year1 = Integer.parseInt(date1.substring(6, 10));
     
     month2 = Integer.parseInt(date2.substring(0, 2));
     day2 = Integer.parseInt(date2.substring(3, 5));
     year2 = Integer.parseInt(date2.substring(6, 10));
    
     for (int i = 0; i < values.size(); i++) {
       int currentMonth = Integer.parseInt(values.get(i).FL_DATE.substring(0, 2));
       int currentDay = Integer.parseInt(values.get(i).FL_DATE.substring(3, 5));
       int currentYear = Integer.parseInt(values.get(i).FL_DATE.substring(6, 10));
       
       if (
       (currentMonth >= month1 && currentMonth <= month2) && 
       (currentDay >= day1 && currentDay <= day2) && 
       (currentYear >= year1 && currentYear <= year2)
       ) {
         flightsInRange++;
     }
  } 
  }
}
  
  
  
  
  
  
  
