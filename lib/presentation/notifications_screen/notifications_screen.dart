import '../notifications_screen/widgets/notifications_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notifications_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends GetWidget<NotificationsController> {
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
                      onTapArrowleft19();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_notifications".tr)),
            body: Container(
                width: getHorizontalSize(327),
                margin: getMargin(left: 24, top: 30, right: 24, bottom: 5),
                padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
                decoration: AppDecoration.outlineIndigo50
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: getPadding(top: 1),
                          child: Text("msg_messages_notifi".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium12)),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding:
                                        getPadding(top: 10.5, bottom: 10.5),
                                    child: SizedBox(
                                        width: getHorizontalSize(295),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50)));
                              },
                              itemCount: controller.notificationsModelObj.value
                                  .notificationsItemList.value.length,
                              itemBuilder: (context, index) {
                                NotificationsItemModel model = controller
                                    .notificationsModelObj
                                    .value
                                    .notificationsItemList
                                    .value[index];
                                return NotificationsItemWidget(model);
                              })))
                    ]))));
  }

  onTapArrowleft19() {
    Get.back();
  }
}
