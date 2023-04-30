import 'controller/select_a_country_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_radio_button.dart';
import 'package:onjobb/widgets/custom_search_view.dart';

class SelectACountryScreen extends GetWidget<SelectACountryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgClose,
                    margin: getMargin(left: 24, top: 13, bottom: 14),
                    onTap: () {
                      onTapClose();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "msg_select_a_countr".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSearchView(
                          focusNode: FocusNode(),
                          controller: controller.frameOneController,
                          hintText: "lbl_search".tr,
                          margin: getMargin(top: 12),
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 17, right: 8, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgSearch)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          suffix: Padding(
                              padding:
                                  EdgeInsets.only(right: getHorizontalSize(15)),
                              child: IconButton(
                                  onPressed: () {
                                    controller.frameOneController.clear();
                                  },
                                  icon: Icon(Icons.clear,
                                      color: Colors.grey.shade600)))),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Obx(() => Column(children: [
                                CustomRadioButton(
                                    text: "lbl_afghanistan".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[0],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(right: 68),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_albania".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[1],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 104),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_algeria".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[2],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 24, right: 107),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_andorra".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[3],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 99),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_angola".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[4],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 24, right: 107),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "msg_antigua_and_bar".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[5],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_argentina".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[6],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 85),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_argentina".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[7],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 85),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_armenia".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[8],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 97),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_australia".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[9],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 24, right: 94),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_austria".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[10],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 24, right: 107),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_azerbaijan".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[11],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 24, right: 80),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    text: "lbl_azerbaijan".tr,
                                    value: controller.selectACountryModelObj
                                        .value.radioList.value[12],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 22, right: 80),
                                    fontStyle: RadioFontStyle
                                        .PlusJakartaSansSemiBold16Gray900,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    })
                              ])))
                    ]))));
  }

  onTapClose() {
    Get.back();
  }
}
