import 'package:onjobb/models/Education.dart';
import 'package:onjobb/models/Experience.dart';

import '../experience_setting_screen/widgets/listuser2_item_widget.dart';
import 'controller/experience_setting_controller.dart';
import 'models/listuser2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

class ExperienceSettingScreen extends GetWidget<ExperienceSettingController> {
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
                      onTapArrowleft14();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_experience".tr)),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, top: 28, right: 24, bottom: 70),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: double.maxFinite,
                            child: Container(
                                padding: getPadding(all: 16),
                                decoration: AppDecoration.outlineIndigo50
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 1),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "lbl_experience".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPlusJakartaSansBold18
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.09)))),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgShare,
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    margin:
                                                        getMargin(bottom: 1),
                                                    onTap: () {
                                                      onTapImgShare();
                                                    })
                                              ])),
                                      Padding(
                                          padding:
                                              getPadding(top: 15, right: 60),
                                          child: Obx(() => ListView.separated(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) {
                                                return Padding(
                                                    padding: getPadding(
                                                        top: 19.5,
                                                        bottom: 19.5),
                                                    child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                295),
                                                        child: Divider(
                                                            height:
                                                                getVerticalSize(
                                                                    1),
                                                            thickness:
                                                                getVerticalSize(
                                                                    1),
                                                            color: ColorConstant
                                                                .indigo50)));
                                              },
                                              itemCount: controller
                                                  .experiencesList.length,
                                              itemBuilder: (context, index) {
                                                Experience experience =
                                                    controller
                                                        .experiencesList[index];
                                                return Listuser2ItemWidget(
                                                    experience.toMap(), false);
                                              })))
                                    ]))),
                        CustomButton(
                            height: getVerticalSize(56),
                            text: "msg_add_new_positio".tr,
                            margin: getMargin(top: 37),
                            padding: ButtonPadding.PaddingAll17,
                            fontStyle:
                                ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                            onTap: () {
                              onTapAddnewposition();
                            }),
                        Container(
                            width: double.maxFinite,
                            child: Container(
                                padding: getPadding(all: 16),
                                margin: getMargin(top: 30),
                                decoration: AppDecoration.outlineIndigo50
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 1),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "lbl_education".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPlusJakartaSansBold18
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.09)))),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgShare,
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    margin:
                                                        getMargin(bottom: 1),
                                                    onTap: () {
                                                      onTapImgShare();
                                                    })
                                              ])),
                                      Padding(
                                          padding:
                                              getPadding(top: 15, right: 60),
                                          child: Obx(() => ListView.separated(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) {
                                                return Padding(
                                                    padding: getPadding(
                                                        top: 19.5,
                                                        bottom: 19.5),
                                                    child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                295),
                                                        child: Divider(
                                                            height:
                                                                getVerticalSize(
                                                                    1),
                                                            thickness:
                                                                getVerticalSize(
                                                                    1),
                                                            color: ColorConstant
                                                                .indigo50)));
                                              },
                                              itemCount: controller
                                                  .educationsList.length,
                                              itemBuilder: (context, index) {
                                                Education education = controller
                                                    .educationsList[index];
                                                
                                                return Listuser2ItemWidget(
                                                    education.toMap(), true);
                                              })))
                                    ])))
                      ])),
            ),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "msg_add_new_educati".tr,
                margin: getMargin(left: 24, right: 24, bottom: 10),
                padding: ButtonPadding.PaddingAll17,
                fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                onTap: () {
                  onTapAddneweducation();
                })));
  }

  onTapImgShare() {
    Get.toNamed(
      AppRoutes.newPositionScreen,
    );
  }

  onTapAddnewposition() {
    Get.toNamed(
      AppRoutes.newPositionScreen,
    );
  }

  onTapAddneweducation() {
    Get.toNamed(
      AppRoutes.addNewEducationScreen,
    );
  }

  onTapArrowleft14() {
    Get.back();
  }
}
