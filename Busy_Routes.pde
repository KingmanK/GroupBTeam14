class busyRoutes
{
 int AL, KY, OH, AK, LA, OK, AZ, ME, OR, AR, MD, PA;
 int SM, MA, PR, CA, MI, RI, CO, MN, SC, CT, MS, SD;
 int DE, MO, TN, DC, MT, TX, FL, NE, TT, GA, NV, UT;
 int GU, NH, VT, HI, NJ, VA, ID, NM, VI, IL, NY, WA;
 int IN, NC, WV, IA, ND, WI, KS, MP, WY;
 
 void getData()
 {
   for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "AL")
      {    
        AL++;
      }
   }
      for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KY")
      {    
        KY++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "OH")
      {    
        OH++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KAK")
      {    
        AK++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "LA")
      {    
        LA++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KY")
      {    
        KY++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KY")
      {    
        KY++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KY")
      {    
        KY++;
      }
   }
         for (int i = 1; i < dataFile.getRowCount(); i++)
   {
      TableRow row = dataFile.getRow(i);
      if (row.getString(8) == "KY")
      {    
        KY++;
      }
   }
   
 }
}
