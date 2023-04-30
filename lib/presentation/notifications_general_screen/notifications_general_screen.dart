import '../notifications_general_screen/widgets/listuser1_item_widget.dart';
import 'controller/notifications_general_controller.dart';
import 'models/listuser1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

class NotificationsGeneralScreen
    extends GetWidget<NotificationsGeneralController> {
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
                      onTapArrowleft9();
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
                        onTapSettings();
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
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle: ButtonFontStyle
                                .PlusJakartaSansSemiBold12WhiteA700_1),
                        CustomButton(
                            height: getVerticalSize(44),
                            width: getHorizontalSize(111),
                            text: "lbl_my_proposals".tr,
                            margin: getMargin(left: 12),
                            variant: ButtonVariant.OutlineBluegray50,
                            shape: ButtonShape.RoundedBorder12,
                            padding: ButtonPadding.PaddingAll16,
                            fontStyle: ButtonFontStyle
                                .PlusJakartaSansSemiBold12Gray600_1,
                            onTap: () {
                              onTapMyproposals();
                            })
                      ]),
                      Padding(
                          padding: getPadding(top: 24, bottom: 117),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding:
                                        getPadding(top: 15.5, bottom: 15.5),
                                    child: SizedBox(
                                        width: getHorizontalSize(323),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50)));
                              },
                              itemCount: controller.notificationsGeneralModelObj
                                  .value.listuser1ItemList.value.length,
                              itemBuilder: (context, index) {
                                Listuser1ItemModel model = controller
                                    .notificationsGeneralModelObj
                                    .value
                                    .listuser1ItemList
                                    .value[index];
                                return Listuser1ItemWidget(model);
                              })))
                    ]))));
  }

  onTapMyproposals() {
    Get.toNamed(
      AppRoutes.notificationsMyProposalsScreen,
    );
  }

  onTapArrowleft9() {
    Get.back();
  }

  onTapSettings() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
