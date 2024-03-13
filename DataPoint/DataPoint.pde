class DataPoint{
  
  String FL_DATE;
  String MKT_CARRIER;
  String MKT_CARRIER_FL_NUM;
  String ORIGIN;
  String ORIGIN_CITY_NAME;
  String ORIGIN_STATE_ABR;
  String ORIGIN_WAC;
  String DEST;
  String DEST_CITY_NAME;
  String DEST_STATE_ABR;
  String DEST_WAC;
  String CRS_DEP_TIME;
  String DEP_TIME;
  String CRS_ARR_TIME;
  String ARR_TIME;
  String CANCELLED;
  String DIVERTED;
  String DISTANCE;
 
  
  DataPoint(Table column){
    FL_DATE = column.getString(0,0);
    MKT_CARRIER = column.getString(0,1);
    MKT_CARRIER_FL_NUM = column.getString(0,2);
    ORIGIN = column.getString(0,3);
    ORIGIN_CITY_NAME = column.getString(0,4);
    ORIGIN_STATE_ABR = column.getString(0,5);
    ORIGIN_WAC = column.getString(0,6);
    DEST = column.getString(0,7);
    DEST_CITY_NAME = column.getString(0,8);
    DEST_STATE_ABR = column.getString(0,9);
    DEST_WAC = column.getString(0,10);
    CRS_DEP_TIME = column.getString(0, 11);
    DEP_TIME = column.getString(0,12);
    CRS_ARR_TIME = column.getString(0,13);
    ARR_TIME = column.getString(0,14);
    CANCELLED = column.getString(0,15);
    DIVERTED = column.getString(0,16);
    DISTANCE = column.getString(0,17);
  }
  
  
  
}
