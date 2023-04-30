import '../controller/onboarding_three_controller.dart';
import '../models/sliderapplicationsurely_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class SliderapplicationsurelyItemWidget extends StatelessWidget {
  SliderapplicationsurelyItemWidget(this.sliderapplicationsurelyItemModelObj,
      {this.onTapBtnGetStarted});

  SliderapplicationsurelyItemModel sliderapplicationsurelyItemModelObj;

  var controller = Get.find<OnboardingThreeController>();

  VoidCallback? onTapBtnGetStarted;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 41,
          top: 32,
          right: 41,
          bottom: 32,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getHorizontalSize(
                214,
              ),
              margin: getMargin(
                left: 14,
                top: 1,
                right: 14,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_application_sur2".tr,
                      style: TextStyle(
                        color: ColorConstant.gray900,
                        fontSize: getFontSize(
                          24,
                        ),
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: getHorizontalSize(
                          0.12,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: "lbl_each_company".tr,
                      style: TextStyle(
                        color: ColorConstant.gray900,
                        fontSize: getFontSize(
                          24,
                        ),
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: getHorizontalSize(
                          0.12,
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: getHorizontalSize(
                243,
              ),
              margin: getMargin(
                top: 14,
              ),
              child: Text(
                "msg_semper_in_cursu".tr,
                maxLines: null,
                textAlign: TextAlign.center,
                style:
                    AppStyle.txtPlusJakartaSansSemiBold14Bluegray300.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.07,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapBtnGetStarted?.call();
              },
              child: Container(
                margin: getMargin(
                  top: 69,
                ),
                padding: getPadding(
                  left: 30,
                  top: 17,
                  right: 32,
                  bottom: 17,
                ),
                width: getHorizontalSize(
                  156,
                ),
                decoration: AppDecoration.btnFillGray900.copyWith(
                  borderRadius: BorderRadiusStyle.btnRoundedBorder24,
                ),
                child: Text(
                  "lbl_get_started".tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.btnPlusJakartaSansSemiBold16Gray50.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.08,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
