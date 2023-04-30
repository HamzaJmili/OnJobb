import 'controller/apply_job_popup_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ApplyJobPopupDialog extends StatelessWidget {
  ApplyJobPopupDialog(this.controller);

  ApplyJobPopupController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(302),
        padding: getPadding(all: 32),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgThumbsup11,
                  height: getSize(101),
                  width: getSize(101)),
              Padding(
                  padding: getPadding(top: 25),
                  child: Text("lbl_success".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansBold18
                          .copyWith(letterSpacing: getHorizontalSize(0.09)))),
              Padding(
                  padding: getPadding(top: 9),
                  child: Text("msg_your_applicatio".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansSemiBold14Bluegray400
                          .copyWith(letterSpacing: getHorizontalSize(0.07)))),
              CustomButton(
                  height: getVerticalSize(46),
                  width: getHorizontalSize(127),
                  text: "lbl_continue".tr,
                  margin: getMargin(top: 23),
                  shape: ButtonShape.RoundedBorder20,
                  padding: ButtonPadding.PaddingAll16,
                  fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                  onTap: () {
                    onTapContinue();
                  })
            ]));
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.appliedJobScreen,
    );
  }
}
