import 'controller/apply_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/presentation/apply_job_popup_dialog/apply_job_popup_dialog.dart';
import 'package:onjobb/presentation/apply_job_popup_dialog/controller/apply_job_popup_controller.dart';

class ApplyJobScreen extends GetWidget<ApplyJobController> {
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
                      onTapArrowleft7();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_apply_job".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 31, right: 24, bottom: 31),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_full_name".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.07))),
                                    Container(
                                        width: double.maxFinite,
                                        child: Container(
                                            width: getHorizontalSize(327),
                                            margin: getMargin(top: 9),
                                            padding: getPadding(
                                                left: 16,
                                                top: 12,
                                                right: 16,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .outlineIndigo50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 5),
                                                      child: Text(
                                                          "msg_brooklyn_simmon"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08))))
                                                ])))
                                  ]))),
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              margin: getMargin(top: 26),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_email_address".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.07))),
                                    Container(
                                        width: double.maxFinite,
                                        child: Container(
                                            width: getHorizontalSize(327),
                                            margin: getMargin(top: 9),
                                            padding: getPadding(
                                                left: 16,
                                                top: 12,
                                                right: 16,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .outlineIndigo50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 5),
                                                      child: Text(
                                                          "lbl_xyz_gmail_com"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08))))
                                                ])))
                                  ]))),
                      Padding(
                          padding: getPadding(top: 28),
                          child: Text("lbl_upload_cv".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              margin: getMargin(top: 7),
                              padding: getPadding(
                                  left: 125, top: 39, right: 125, bottom: 39),
                              decoration: AppDecoration.outlineIndigo502
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder24),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgLock,
                                        height: getSize(40),
                                        width: getSize(40)),
                                    Padding(
                                        padding: getPadding(top: 8),
                                        child: Text("lbl_upload_file".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansSemiBold14Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.07))))
                                  ]))),
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              margin: getMargin(top: 28, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("msg_website_blog".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.07))),
                                    Container(
                                        width: double.maxFinite,
                                        child: Container(
                                            width: getHorizontalSize(327),
                                            margin: getMargin(top: 7),
                                            padding: getPadding(
                                                left: 16,
                                                top: 12,
                                                right: 16,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .outlineIndigo50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 5),
                                                      child: Text(
                                                          "lbl_https".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08))))
                                                ])))
                                  ])))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "lbl_continue".tr,
                margin: getMargin(left: 24, right: 24, bottom: 40),
                padding: ButtonPadding.PaddingAll17,
                fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                onTap: () {
                  onTapContinue();
                })));
  }

  onTapContinue() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.only(left: 0),
      content: ApplyJobPopupDialog(
        Get.put(
          ApplyJobPopupController(),
        ),
      ),
    ));
  }

  onTapArrowleft7() {
    Get.back();
  }
}
