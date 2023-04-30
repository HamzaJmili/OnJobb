import 'controller/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';

class PersonalInfoScreen extends GetWidget<PersonalInfoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                      onTapArrowleft13();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_personal_info".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgEdit,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 32, right: 24, bottom: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_first_name".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPlusJakartaSansMedium14.copyWith(
                              letterSpacing: getHorizontalSize(0.07))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.frameOneController,
                          hintText: "lbl_gustavo".tr,
                          margin: getMargin(top: 9)),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Text("lbl_last_name".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.frameOneOneController,
                          hintText: "lbl_lipshutz".tr,
                          margin: getMargin(top: 9)),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Text("lbl_email".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.emailOneController,
                          hintText: "lbl_xyz_gmail_com".tr,
                          margin: getMargin(top: 9),
                          textInputType: TextInputType.emailAddress),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Text("lbl_phone".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.mobileNoController,
                          hintText: "lbl_1_1234567890".tr,
                          margin: getMargin(top: 9)),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Text("lbl_location".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.frameOneTwoController,
                          hintText: "lbl_lorem_ipsun".tr,
                          margin: getMargin(top: 9, bottom: 5),
                          padding: TextFormFieldPadding.PaddingT55,
                          textInputAction: TextInputAction.done,
                          maxLines: 6)
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "lbl_save_changes".tr,
                margin: getMargin(left: 24, right: 24, bottom: 44),
                variant: ButtonVariant.FillBluegray5001,
                padding: ButtonPadding.PaddingAll17,
                fontStyle:
                    ButtonFontStyle.PlusJakartaSansSemiBold16Bluegray300_1,
                onTap: () {
                  onBackPressed();
                })));
  }

  onBackPressed() {
    Get.back();
  }

  onTapArrowleft13() {
    Get.back();
  }
}
