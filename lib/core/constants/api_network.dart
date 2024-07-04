class ApiNetwork {
  static const String domain = "bharattoken.org/sliceLedger/admin";
  static const String baseUrl = "http://$domain/api/";

  static const String login = "${baseUrl}auth/login";
  static const String signUp = "${baseUrl}auth/signUp";
  static const String otpVerification = "${baseUrl}auth/verifyOtp";
  static const String logoutDevice = "${baseUrl}auth/deviceLogout";
  static const String getCurrentUser = "${baseUrl}auth/loginActivity";
  static const String logout = "${baseUrl}auth/logout";
  static const String order = "${baseUrl}auth/userOrder";
}
