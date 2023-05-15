import 'controller/job_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

class JobTypeScreen extends GetWidget<JobTypeController> {
  final String email = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(24),
                          width: getSize(24),
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgArrowleft();
                          }),
                      Padding(
                          padding: getPadding(top: 47),
                          child: Text("lbl_choose_job_type".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.12)))),
                      Container(
                          width: getHorizontalSize(209),
                          margin: getMargin(top: 7),
                          child: Text("msg_are_you_looking".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle
                                  .txtPlusJakartaSansMedium14Bluegray400
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      Padding(
                          padding: getPadding(top: 38, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.isFreelancer.value = true;
                                          print(controller.isFreelancer);
                                        },
                                        child: Obx(
                                          () => Container(
                                              margin: getMargin(right: 7),
                                              padding: getPadding(
                                                  left: 18,
                                                  top: 24,
                                                  right: 18,
                                                  bottom: 24),
                                              decoration: controller
                                                      .isFreelancer.isTrue
                                                  ? AppDecoration.outlineGray900
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder24)
                                                  : AppDecoration
                                                      .outlineGray70014
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder24),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomIconButton(
                                                        height: 64,
                                                        width: 64,
                                                        variant:
                                                            IconButtonVariant
                                                                .FillGray90065,
                                                        shape: IconButtonShape
                                                            .CircleBorder32,
                                                        padding:
                                                            IconButtonPadding
                                                                .PaddingAll16,
                                                        child: CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgIcon)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 29),
                                                        child: Text(
                                                            "lbl_find_a_job".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPlusJakartaSansSemiBold16Gray900
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.08)))),
                                                    Container(
                                                        width:
                                                            getHorizontalSize(
                                                                120),
                                                        margin: getMargin(
                                                            top: 9, bottom: 1),
                                                        child: Text(
                                                            "msg_it_s_easy_to_fi"
                                                                .tr,
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .txtPlusJakartaSansMedium12
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.06))))
                                                  ])),
                                        ))),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.isFreelancer.value = false;
                                          print(controller.isFreelancer);
                                        },
                                        child: Obx(
                                          () => Container(
                                              margin: getMargin(left: 7),
                                              padding: getPadding(
                                                  left: 14,
                                                  top: 24,
                                                  right: 14,
                                                  bottom: 24),
                                              decoration: controller
                                                      .isFreelancer.isFalse
                                                  ? AppDecoration.outlineGray900
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder24)
                                                  : AppDecoration
                                                      .outlineGray70014
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder24),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomIconButton(
                                                        height: 64,
                                                        width: 64,
                                                        variant:
                                                            IconButtonVariant
                                                                .FillOrange50065,
                                                        shape: IconButtonShape
                                                            .CircleBorder32,
                                                        padding:
                                                            IconButtonPadding
                                                                .PaddingAll16,
                                                        child: CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgUser)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 29),
                                                        child: Text(
                                                            "lbl_find_a_employee"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPlusJakartaSansSemiBold16Gray900
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.08)))),
                                                    Container(
                                                        width:
                                                            getHorizontalSize(
                                                                109),
                                                        margin: getMargin(
                                                            top: 9, bottom: 1),
                                                        child: Text(
                                                            "msg_it_s_easy_to_fi2"
                                                                .tr,
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .txtPlusJakartaSansMedium12
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.06))))
                                                  ])),
                                        )))
                              ]))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "lbl_continue".tr,
                margin: getMargin(left: 24, right: 24, bottom: 55),
                padding: ButtonPadding.PaddingAll17,
                fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                onTap: () {
                  onTapContinue();
                })));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapContinue() {
    Get.toNamed(AppRoutes.speciallizationScreen, arguments: {
      'isFreelancer': controller.isFreelancer.value,
      'email': email,
    });
  }
}
