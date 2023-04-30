import '../controller/onboarding_two_controller.dart';
import '../models/slidermessage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class SlidermessageItemWidget extends StatelessWidget {
  SlidermessageItemWidget(this.slidermessageItemModelObj,
      {this.onTapBtnNextstep});

  SlidermessageItemModel slidermessageItemModelObj;

  var controller = Get.find<OnboardingTwoController>();

  VoidCallback? onTapBtnNextstep;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 24,
          top: 32,
          right: 24,
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
                273,
              ),
              margin: getMargin(
                left: 6,
                top: 1,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "lbl_better".tr,
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
                      text: "msg_future_is_starting".tr,
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
                left: 17,
                top: 14,
                right: 17,
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
                onTapBtnNextstep?.call();
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
                  101,
                ),
                decoration: AppDecoration.btnFillGray900.copyWith(
                  borderRadius: BorderRadiusStyle.btnRoundedBorder24,
                ),
                child: Text(
                  "lbl_next".tr,
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
