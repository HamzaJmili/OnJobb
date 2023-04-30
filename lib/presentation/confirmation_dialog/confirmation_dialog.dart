import 'controller/confirmation_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ConfirmationDialog extends StatelessWidget {
  ConfirmationDialog(this.controller);

  ConfirmationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(331),
        padding: getPadding(left: 25, top: 39, right: 25, bottom: 39),
        decoration: AppDecoration.fillWhiteA70003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: getHorizontalSize(279),
                  margin: getMargin(top: 3),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl_i_agree_to_the".tr,
                            style: TextStyle(
                                color: ColorConstant.blueGray400,
                                fontSize: getFontSize(16),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: getHorizontalSize(0.08))),
                        TextSpan(
                            text: "msg_terms_of_servic".tr,
                            style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(16),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: getHorizontalSize(0.08))),
                        TextSpan(
                            text: "lbl_and".tr,
                            style: TextStyle(
                                color: ColorConstant.blueGray400,
                                fontSize: getFontSize(16),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: getHorizontalSize(0.08))),
                        TextSpan(
                            text: "msg_conditions_of_u".tr,
                            style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(16),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: getHorizontalSize(0.08))),
                        TextSpan(
                            text: "msg_including_conse".tr,
                            style: TextStyle(
                                color: ColorConstant.blueGray400,
                                fontSize: getFontSize(16),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: getHorizontalSize(0.08)))
                      ]),
                      textAlign: TextAlign.center)),
              CustomButton(
                  height: getVerticalSize(46),
                  width: getHorizontalSize(181),
                  text: "msg_agree_and_conti".tr,
                  margin: getMargin(top: 21),
                  shape: ButtonShape.RoundedBorder20,
                  padding: ButtonPadding.PaddingAll16,
                  fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                  onTap: () {
                    onTapAgreeandcontinue();
                  }),
              Padding(
                  padding: getPadding(top: 28),
                  child: Text("lbl_disgree".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansSemiBold14RedA200
                          .copyWith(letterSpacing: getHorizontalSize(0.07))))
            ]));
  }

  onTapAgreeandcontinue() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
