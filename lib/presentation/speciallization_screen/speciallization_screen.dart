import 'controller/speciallization_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';
import 'package:onjobb/presentation/confirmation_dialog/confirmation_dialog.dart';
import 'package:onjobb/presentation/confirmation_dialog/controller/confirmation_controller.dart';

class SpeciallizationScreen extends GetWidget<SpeciallizationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70002,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 23, top: 13, right: 23, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(24),
                          width: getSize(24),
                          alignment: Alignment.centerLeft,
                          margin: getMargin(left: 1),
                          onTap: () {
                            onTapImgArrowleft();
                          }),
                      Container(
                          width: getHorizontalSize(177),
                          margin: getMargin(top: 44),
                          child: Text("msg_what_is_your_specialization".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPlusJakartaSansBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.12)))),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text("msg_lorem_ipsum_dol7".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .txtPlusJakartaSansMedium14Bluegray400
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163009Controller,
                          hintText: "msg_design_creati".tr,
                          margin: getMargin(top: 31),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 16, bottom: 12),
                              decoration:
                                  BoxDecoration(color: ColorConstant.gray900),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgCheckmark24x24)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163010Controller,
                          hintText: "msg_development_i".tr,
                          margin: getMargin(top: 16),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 17, bottom: 12),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsIndigo5001)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163011Controller,
                          hintText: "msg_engineering_a".tr,
                          margin: getMargin(top: 16),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 17, bottom: 12),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsIndigo5001)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163012Controller,
                          hintText: "msg_sales_marketi".tr,
                          margin: getMargin(top: 16),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 17, bottom: 12),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsIndigo5001)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163013Controller,
                          hintText: "lbl_writing".tr,
                          margin: getMargin(top: 16),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 17, bottom: 12),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsIndigo5001)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.group163014Controller,
                          hintText: "lbl_finance".tr,
                          margin: getMargin(top: 16, bottom: 5),
                          padding: TextFormFieldPadding.PaddingT13,
                          fontStyle: TextFormFieldFontStyle
                              .PlusJakartaSansSemiBold16Gray900,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 17, bottom: 12),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsIndigo5001)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48)))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "lbl_continue".tr,
                margin: getMargin(left: 24, right: 24, bottom: 39),
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
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.only(left: 0),
      content: ConfirmationDialog(
        Get.put(
          ConfirmationController(),
        ),
      ),
    ));
  }
}
