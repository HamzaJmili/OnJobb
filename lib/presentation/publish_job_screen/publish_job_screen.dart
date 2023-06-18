
import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/publish_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/presentation/apply_job_popup_dialog/apply_job_popup_dialog.dart';
import 'package:onjobb/presentation/apply_job_popup_dialog/controller/apply_job_popup_controller.dart';

class PublishJobScreen extends GetWidget<PublishJobController> {
  final String uid = Get.arguments['uid'];
  final String fullName = Get.arguments['fullName'];
   final String imageUrl = Get.arguments['imageUrl'];
 
  final PublishJobController controller = Get.put(PublishJobController());
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
                title: AppbarTitle(text: "Create new Post")),
            body: SingleChildScrollView(
              child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: getPadding(top: 14),
                                        child: Text("lbl_title".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansMedium16Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.07))),
                                      ),
                                      CustomTextFormField(
                                          focusNode: FocusNode(),
                                          controller: controller.title,
                                          hintText: "UI / UX designer",
                                          margin: getMargin(top: 9),
                                          padding:
                                              TextFormFieldPadding.PaddingT15),
                                    ]))),
                        SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 15),
                                        child: Text(
                                          'lbl_maxSalary'.tr,
                                        ),
                                      ),
                                      CustomTextFormField(
                                        focusNode: FocusNode(),
                                        controller: controller.maxSalary,
                                        hintText: '800\$',
                                        margin: getMargin(top: 9),
                                        padding:
                                            TextFormFieldPadding.PaddingT15,
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 15),
                                        child: Text(
                                         'lbl_minSalary'.tr
                                        ),
                                      ),
                                      CustomTextFormField(
                                        focusNode: FocusNode(),
                                        controller: controller.minSalary,
                                        hintText: '200\$',
                                        margin: getMargin(top: 9),
                                        padding:
                                            TextFormFieldPadding.PaddingT15_1,
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 16.0,
                            left: 32.0,
                            right: 37.0,
                            bottom: 16.0,
                          ),
                          child: Text(
"lbl_job_type".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansMedium14
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07))),
                        ),
                        Container(
                          child: GetX<PublishJobController>(
                            builder: (controller) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomRadioButton(
                                    value: 'remote',
                                    groupValue:
                                        controller.selectedJobType.value,
                                    onChange: (value) {
                                      print(
                                          " the previous value is ${controller.selectedJobType.value}");
                                      controller.selectedJobType.value = value;
                                      print(
                                          " the previous value is ${controller.selectedJobType.value}");
                                    },
                                    text: "Remote".tr,
                                  ),
                                  CustomRadioButton(
                                    value: 'on-site',
                                    groupValue:
                                        controller.selectedJobType.value,
                                    onChange: (value) {
                                      controller.selectedJobType.value = value;
                                    },
                                    text: 'On-site'.tr,
                                  ),
                                  CustomRadioButton(
                                    value: 'one-time',
                                    groupValue:
                                        controller.selectedJobType.value,
                                    onChange: (value) {
                                      controller.selectedJobType.value = value;
                                    },
                                    text: 'One-time Job'.tr,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                            padding: getPadding(top: 28),
                            child: Text(
                                "Job Description : write at least 345 caracteres ".tr,
                               overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansMedium16Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.07)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: controller.description,
                            hintText: "Describe the job".tr,
                            margin: getMargin(
                              top: 20,
                              bottom: 12,
                            ),
                            padding: TextFormFieldPadding.PaddingT55,
                            textInputAction: TextInputAction.done,
                            maxLines: 4),
                        // Text("msg_website_blog".tr,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.left,
                        //     style: AppStyle.txtPlusJakartaSansMedium14.copyWith(
                        //         letterSpacing: getHorizontalSize(0.07))),
                        // CustomTextFormField(
                        //     focusNode: FocusNode(),
                        //     // controller: controller.frameOneOneController,
                        //     hintText: "Https://",
                        //     margin: getMargin(top: 14),
                        //     padding: TextFormFieldPadding.PaddingT15),
                      ])),
            ),
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

  onTapContinue() async {
    
    bool jobAdded = await controller.addJob( uid ,fullName , imageUrl);
    
    jobAdded == true
        ? Get.dialog(AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(left: 0),
            content: ApplyJobPopupDialog(
              Get.put(
                ApplyJobPopupController(),
              ),
            ),
          ))
        : '';
  }

  onTapArrowleft7() {
    Get.back();
  }
}
