import '../controller/experience_setting_controller.dart';
import '../models/listuser2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Listuser2ItemWidget extends StatelessWidget {
  Listuser2ItemWidget(this.listuser2ItemModelObj);

  Listuser2ItemModel listuser2ItemModelObj;

  var controller = Get.find<ExperienceSettingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          height: 48,
          width: 48,
          child: CustomImageView(
            svgPath: ImageConstant.imgUser48x48,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 12,
            top: 5,
            bottom: 1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  listuser2ItemModelObj.internshipuiuxTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPlusJakartaSansSemiBold14Gray900.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.07,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        "lbl_shopee_sg".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 3,
                        top: 1,
                      ),
                      child: Text(
                        "lbl".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        bottom: 1,
                      ),
                      child: Obx(
                        () => Text(
                          listuser2ItemModelObj.zipcodeTxt.value,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
