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
  
  DataPoint(TableRow row){
    FL_DATE = row.getString(0);
    MKT_CARRIER = row.getString(1);
    MKT_CARRIER_FL_NUM = row.getString(2);
    ORIGIN = row.getString(3);
    ORIGIN_CITY_NAME = row.getString(4);
    ORIGIN_STATE_ABR = row.getString(5);
    ORIGIN_WAC = row.getString(6);
    DEST = row.getString(7);
    DEST_CITY_NAME = row.getString(8);
    DEST_STATE_ABR = row.getString(9);
    DEST_WAC = row.getString(10);
    CRS_DEP_TIME = row.getString( 11);
    DEP_TIME = row.getString(12);
    CRS_ARR_TIME = row.getString(13);
    ARR_TIME = row.getString(14);
    CANCELLED = row.getString(15);
    DIVERTED = row.getString(16);
    DISTANCE = row.getString(17);
  }
  
  
  
}

  
