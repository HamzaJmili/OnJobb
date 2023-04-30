import '../message_page/widgets/message_item_widget.dart';
import 'controller/message_controller.dart';
import 'models/message_item_model.dart';
import 'models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class MessagePage extends StatelessWidget {
  MessageController controller = Get.put(MessageController(MessageModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 13, bottom: 14),
                    onTap: () {
                      onTapArrowleft2();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_message".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 20, right: 24, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(top: 4),
                          padding: getPadding(
                              left: 16, top: 10, right: 16, bottom: 10),
                          decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                    height: getSize(18),
                                    width: getSize(18),
                                    margin: getMargin(top: 4, bottom: 4)),
                                Padding(
                                    padding: getPadding(left: 8, top: 1),
                                    child: Text("msg_search_message".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                Spacer(),
                                SizedBox(
                                    height: getVerticalSize(26),
                                    child: VerticalDivider(
                                        width: getHorizontalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.indigo50,
                                        indent: getHorizontalSize(4),
                                        endIndent: getHorizontalSize(4))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgSettingsGray900,
                                    height: getSize(18),
                                    width: getSize(18),
                                    margin:
                                        getMargin(left: 7, top: 4, bottom: 4))
                              ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding: getPadding(top: 7.5, bottom: 7.5),
                                    child: SizedBox(
                                        width: getHorizontalSize(327),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50)));
                              },
                              itemCount: controller.messageModelObj.value
                                  .messageItemList.value.length,
                              itemBuilder: (context, index) {
                                MessageItemModel model = controller
                                    .messageModelObj
                                    .value
                                    .messageItemList
                                    .value[index];
                                return MessageItemWidget(model,
                                    onTapRowdot: () {
                                  onTapRowdot();
                                });
                              }))),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(46),
                          width: getHorizontalSize(137),
                          text: "lbl_new_chat".tr,
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingT14,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                          prefixWidget: Container(
                              margin: getMargin(right: 4),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgPlus18x18)))
                    ]))));
  }

  onTapRowdot() {
    Get.toNamed(AppRoutes.chatScreen);
  }

  onTapArrowleft2() {
    Get.back();
  }
}
