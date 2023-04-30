import '../controller/message_controller.dart';
import '../models/message_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class MessageItemWidget extends StatelessWidget {
  MessageItemWidget(this.messageItemModelObj, {this.onTapRowdot});

  MessageItemModel messageItemModelObj;

  var controller = Get.find<MessageController>();

  VoidCallback? onTapRowdot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        73,
      ),
      width: getHorizontalSize(
        327,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: getSize(
                56,
              ),
              width: getSize(
                56,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.gray100,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    28,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                onTapRowdot?.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: getSize(
                      56,
                    ),
                    width: getSize(
                      56,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage56x561,
                          height: getSize(
                            56,
                          ),
                          width: getSize(
                            56,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              28,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: getSize(
                              16,
                            ),
                            width: getSize(
                              16,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.tealA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  8,
                                ),
                              ),
                              border: Border.all(
                                color: ColorConstant.whiteA700,
                                width: getHorizontalSize(
                                  1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 12,
                      top: 3,
                      bottom: 1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            messageItemModelObj.estherhowardTxt.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPlusJakartaSansBold18.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.09,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 9,
                          ),
                          child: Text(
                            "msg_lorem_ipsum_dol".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle
                                .txtPlusJakartaSansMedium14Bluegray400
                                .copyWith(
                              letterSpacing: getHorizontalSize(
                                0.07,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 30,
                      top: 7,
                      bottom: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_10_20".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle
                              .txtPlusJakartaSansSemiBold12Bluegray400
                              .copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                        Container(
                          width: getSize(
                            24,
                          ),
                          margin: getMargin(
                            top: 6,
                          ),
                          padding: getPadding(
                            left: 8,
                            top: 5,
                            right: 8,
                            bottom: 5,
                          ),
                          decoration: AppDecoration.txtFillGray900.copyWith(
                            borderRadius: BorderRadiusStyle.txtCircleBorder14,
                          ),
                          child: Obx(
                            () => Text(
                              messageItemModelObj.group162722Txt.value,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansSemiBold10
                                  .copyWith(
                                letterSpacing: getHorizontalSize(
                                  0.05,
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
          ),
        ],
      ),
    );
  }
}
