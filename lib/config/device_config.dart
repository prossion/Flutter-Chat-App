import 'package:flutter/material.dart';

class DeviceData {
  double? screenWidth;
  double? screenHeight;
  Orientation? orientation;
  DeviceType? deviceType;
  DeviceData.init(BuildContext context) {
    screenHeight = _getHeight(context);
    screenWidth = _getWidth(context);
    orientation = MediaQuery.of(context).orientation;
    deviceType = _getDeviceType(context);
  }
}

enum DeviceType { mobile, tablet, desktop }

DeviceType _getDeviceType(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  double width = 0;

  if (orientation == Orientation.landscape) {
    width = MediaQuery.of(context).size.height;
  } else {
    width = MediaQuery.of(context).size.width;
  }
  if (width >= 950) {
    return DeviceType.desktop;
  }
  if (width >= 600) {
    return DeviceType.tablet;
  }
  return DeviceType.mobile;
}

double _getWidth(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height;
  } else {
    return MediaQuery.of(context).size.width;
  }
}

double _getHeight(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width;
  } else {
    return MediaQuery.of(context).size.height;
  }
}
