class ApiEndPoints{
  
  // static const kBaseUrl = 'http://localhost:3000';
  static const String kBaseUrl = 'http://192.168.115.143:3000';

  static const String kLoginUrl = '$kBaseUrl/auth/login';
  static const String kSignupUrl = '$kBaseUrl/auth/signup';
  static const String kGetCurrentUserUrl = '$kBaseUrl/auth/curretn_user';
  static const String kUpdateUserUrl = '$kBaseUrl/auth/update';

  static const String kGetAllFoodUrl = '$kBaseUrl/food/getAll';
  
  static const String kGetAllReservationUrl = '$kBaseUrl/reservation-table/getAll';
  static const String kCreateReservationTableUrl = '$kBaseUrl/reservation-table/update';

  static const String kGetAllOrderUrl = '$kBaseUrl/order/getAll';
  static const String kAddOrderOUrl = '$kBaseUrl/order/add';
  static String kCompleteOrderOUrl = '$kBaseUrl/order/complete_order';

  static String kGeocodinUrl(double lat, double long)=> 'https://geocode.maps.co/reverse?lat=$lat&lon=$long&api_key=66c3a7731c438208023059stlc50aae';

}