const String baseUrl = 'https://exam.elevateegy.com/api/v1/';

class ApiEndPoints {
  ApiEndPoints._();

  static const String signIn = "/drivers/signin";
  static const String forgetPassword = "/drivers/forgotPassword";
  static const String verifyResetCode = "/drivers/verifyResetCode";
  static const String resetPassword = "/drivers/resetPassword";
  static const String applyEndPoint = "/drivers/apply";
  static const String allVehicleEndPoint = "/vehicles";
  static const String pendingOrdersEndPoint = "/orders/pending-orders";
}
