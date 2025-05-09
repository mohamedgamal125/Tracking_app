const String baseUrl = 'https://exam.elevateegy.com/api/v1/';

class ApiEndPoints {
  ApiEndPoints._();

  static const String signIn = "signin";
  static const String forgetPassword = "forgotPassword";
  static const String verifyResetCode = "verifyResetCode";
  static const String resetPassword = "resetPassword";
  static const String applyEndPoint = "/drivers/apply";
  static const String allVehicleEndPoint = "/vehicles";
  static const String updateOrderStateEndPoint = "orders/state";
}
