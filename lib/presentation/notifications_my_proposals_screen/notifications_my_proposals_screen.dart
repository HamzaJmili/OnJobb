import '../notifications_my_proposals_screen/widgets/listlocation_item_widget.dart';
import 'controller/notifications_my_proposals_controller.dart';
import 'models/listlocation_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

class NotificationsMyProposalsScreen
    extends GetWidget<NotificationsMyProposalsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowleft10();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_notifications".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettings,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13),
                      onTap: () {
                        onTapSettings1();
                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 30, right: 24, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        CustomButton(
                            height: getVerticalSize(44),
                            width: getHorizontalSize(79),
                            text: "lbl_general".tr,
                            variant: ButtonVariant.OutlineIndigo50,
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle: ButtonFontStyle
                                .PlusJakartaSansSemiBold12Gray600_1,
                            onTap: () {
                              onTapGeneral();
                            }),
                        CustomButton(
                            height: getVerticalSize(44),
                            width: getHorizontalSize(111),
                            text: "lbl_my_proposals".tr,
                            margin: getMargin(left: 12),
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle:
                                ButtonFontStyle.PlusJakartaSansSemiBold12Gray50)
                      ]),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 4),
                                    child: Text("msg_application_sta".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPlusJakartaSansBold16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowup,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1))
                              ])),
                      Padding(
                          padding: getPadding(top: 22, right: 115),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding:
                                        getPadding(top: 16.5, bottom: 16.5),
                                    child: SizedBox(
                                        width: getHorizontalSize(327),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50)));
                              },
                              itemCount: controller
                                  .notificationsMyProposalsModelObj
                                  .value
                                  .listlocationItemList
                                  .value
                                  .length,
                              itemBuilder: (context, index) {
                                ListlocationItemModel model = controller
                                    .notificationsMyProposalsModelObj
                                    .value
                                    .listlocationItemList
                                    .value[index];
                                return ListlocationItemWidget(model);
                              })))
                    ]))));
  }

  onTapGeneral() {
    Get.toNamed(
      AppRoutes.notificationsGeneralScreen,
    );
  }

  onTapArrowleft10() {
    Get.back();
  }

  onTapSettings1() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
