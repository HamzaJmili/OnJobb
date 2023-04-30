import '../controller/notifications_general_controller.dart';
import '../models/listuser1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Listuser1ItemWidget extends StatelessWidget {
  Listuser1ItemWidget(this.listuser1ItemModelObj);

  Listuser1ItemModel listuser1ItemModelObj;

  var controller = Get.find<NotificationsGeneralController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          height: 32,
          width: 32,
          margin: getMargin(
            bottom: 62,
          ),
          shape: IconButtonShape.CircleBorder16,
          padding: IconButtonPadding.PaddingAll2,
          child: CustomImageView(
            svgPath: ImageConstant.imgUser48x48,
          ),
        ),
        Container(
          height: getVerticalSize(
            90,
          ),
          width: getHorizontalSize(
            287,
          ),
          margin: getMargin(
            top: 4,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "lbl_32_min_ago".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:
                      AppStyle.txtPlusJakartaSansMedium12Bluegray300.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.06,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        listuser1ItemModelObj.languageTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansBold14.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.07,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 7,
                      ),
                      child: Obx(
                        () => Text(
                          listuser1ItemModelObj.shopeesgTxt.value,
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
                    Container(
                      width: getHorizontalSize(
                        233,
                      ),
                      margin: getMargin(
                        top: 10,
                      ),
                      child: Text(
                        "msg_lorem_ipsum_dol5".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtPlusJakartaSansMedium12Gray900.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
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
