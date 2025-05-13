import 'package:tracking_app/core/services/screen_size_service.dart';

double responsiveHeight(double height) {
  final screenHeight = ScreenSizeService.height;
  return (height / ScreenSizeService.baseHeight) * screenHeight;
}

double responsiveWidth(double width) {
  final screenWidth = ScreenSizeService.width;
  return (width / ScreenSizeService.baseWidth) * screenWidth;
}
