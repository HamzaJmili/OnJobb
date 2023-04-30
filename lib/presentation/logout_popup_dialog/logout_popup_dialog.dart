import 'controller/logout_popup_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class LogoutPopupDialog extends StatelessWidget {
  LogoutPopupDialog(this.controller);

  LogoutPopupController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(306),
        padding: getPadding(all: 32),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgQuestion82x82,
                  height: getSize(82),
                  width: getSize(82),
                  margin: getMargin(top: 9)),
              Padding(
                  padding: getPadding(top: 35),
                  child: Text("lbl_are_you_sure".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansBold18
                          .copyWith(letterSpacing: getHorizontalSize(0.09)))),
              Container(
                  width: getHorizontalSize(229),
                  margin: getMargin(left: 6, top: 8, right: 5),
                  child: Text("msg_ullamcorper_imp".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtPlusJakartaSansSemiBold14Bluegray400
                          .copyWith(letterSpacing: getHorizontalSize(0.07)))),
              Padding(
                  padding: getPadding(top: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomButton(
                                height: getVerticalSize(46),
                                text: "lbl_log_out2".tr,
                                margin: getMargin(right: 6),
                                variant: ButtonVariant.OutlineGray900,
                                shape: ButtonShape.RoundedBorder20,
                                padding: ButtonPadding.PaddingAll16,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold14Gray900_1,
                                onTap: () {
                                  onTapLogout();
                                })),
                        Expanded(
                            child: CustomButton(
                                height: getVerticalSize(46),
                                text: "lbl_cancel".tr,
                                margin: getMargin(left: 6),
                                shape: ButtonShape.RoundedBorder20,
                                padding: ButtonPadding.PaddingAll16,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold14Gray50,
                                onTap: () {
                                  onTapCancel();
                                }))
                      ]))
            ]));
  }

  onTapLogout() {
    Get.offAllNamed(
      AppRoutes.signUpCreateAcountScreen,
    );
  }

  onTapCancel() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
