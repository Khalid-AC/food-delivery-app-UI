import "package:flutter/material.dart";

//
Size getDeviceSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getScreenHeight(BuildContext context) {
  final screenSize = getDeviceSize(context);
  return screenSize.height;
}

double getScreenWidth(BuildContext context) {
  final screenSize = getDeviceSize(context);
  return screenSize.width;
}
