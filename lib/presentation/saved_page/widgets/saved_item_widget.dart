import '../controller/saved_controller.dart';
import '../models/saved_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SavedItemWidget extends StatelessWidget {
  SavedItemWidget(this.savedItemModelObj, {this.onTapSaveJobDetails});

  SavedItemModel savedItemModelObj;

  var controller = Get.find<SavedController>();

  VoidCallback? onTapSaveJobDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSaveJobDetails?.call();
      },
      child: Container(
        padding: getPadding(
          all: 16,
        ),
        decoration: AppDecoration.outlineIndigo50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconButton(
              height: 48,
              width: 48,
              margin: getMargin(
                bottom: 68,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgUser48x48,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 10,
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      savedItemModelObj.uxdesignerTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansBold16.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.08,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 6,
                    ),
                    child: Obx(
                      () => Text(
                        savedItemModelObj.dummystudioTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansSemiBold12Bluegray300
                            .copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 10,
                    ),
                    child: Text(
                      "msg_560_12_000".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                          AppStyle.txtPlusJakartaSansMedium12Gray600.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 13,
                    ),
                    child: Row(
                      children: [
                        CustomButton(
                          height: getVerticalSize(
                            28,
                          ),
                          width: getHorizontalSize(
                            70,
                          ),
                          text: "lbl_fulltime".tr,
                          variant: ButtonVariant.FillGray100,
                          shape: ButtonShape.RoundedBorder8,
                        ),
                        CustomButton(
                          height: getVerticalSize(
                            28,
                          ),
                          width: getHorizontalSize(
                            103,
                          ),
                          text: "lbl_two_days_ago".tr,
                          margin: getMargin(
                            left: 8,
                          ),
                          variant: ButtonVariant.FillGray100,
                          shape: ButtonShape.RoundedBorder8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgBookmark1,
              height: getSize(
                24,
              ),
              width: getSize(
                24,
              ),
              margin: getMargin(
                left: 30,
                bottom: 92,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
