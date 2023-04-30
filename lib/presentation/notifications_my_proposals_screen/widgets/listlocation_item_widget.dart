import '../controller/notifications_my_proposals_controller.dart';
import '../models/listlocation_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListlocationItemWidget extends StatelessWidget {
  ListlocationItemWidget(this.listlocationItemModelObj);

  ListlocationItemModel listlocationItemModelObj;

  var controller = Get.find<NotificationsMyProposalsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          height: 48,
          width: 48,
          margin: getMargin(
            bottom: 42,
          ),
          child: CustomImageView(
            svgPath: ImageConstant.imgLocation,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 12,
            top: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "msg_senior_ui_ux_de".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPlusJakartaSansBold14.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.07,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Obx(
                  () => Text(
                    listlocationItemModelObj.smalllabelregulTxt.value,
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
              CustomButton(
                height: getVerticalSize(
                  28,
                ),
                width: getHorizontalSize(
                  78,
                ),
                text: "lbl_opened".tr,
                margin: getMargin(
                  top: 17,
                ),
                variant: ButtonVariant.FillGreen50,
                shape: ButtonShape.RoundedBorder4,
                fontStyle: ButtonFontStyle.InterRegular12GreenA700_1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
