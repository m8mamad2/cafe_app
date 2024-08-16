class ApiEndPoints{
  
  // static const kBaseUrl = 'http://localhost:3000';
  static const String kBaseUrl = 'http://192.168.252.143:3000';

  static const String kLoginUrl = '$kBaseUrl/auth/login';
  static const String kSignupUrl = '$kBaseUrl/auth/signup';
  static const String kGetCurrentUserUrl = '$kBaseUrl/auth/curretn_user';
  static const String kUpdateUserUrl = '$kBaseUrl/auth/update';

  static const String kGetAllFoodUrl = '$kBaseUrl/food/getAll';
  
  static const String kGetAllReservationUrl = '$kBaseUrl/reservation-table/getAll';
  static const String kCreateReservationTableUrl = '$kBaseUrl/reservation-table/create';

}