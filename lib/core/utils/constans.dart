import 'package:flutter/material.dart';
import 'package:tracking_app/core/services/screen_size_service.dart';

final kHorizontalPadding =
    ScreenSizeService.width * (16 / ScreenSizeService.baseWidth);
final kVerticalPadding =
    ScreenSizeService.height * (24 / ScreenSizeService.baseHeight);
final kVerticalHPadding =
    ScreenSizeService.height * (10 / ScreenSizeService.baseHeight);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
