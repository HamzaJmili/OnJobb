import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgGroup162797,
                          height: getVerticalSize(153),
                          width: getHorizontalSize(102),
                          margin: getMargin(bottom: 5))
                    ]))));
  }
}
