import 'package:flutter/material.dart';
import 'controller/sign_up_complete_account_controller.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpCompleteAccountScreen
    extends GetWidget<SignUpCompleteAccountController> {
  String? previousRoute = Get.previousRoute;

  final bool isFreelancer = Get.arguments['isFreelancer'];
  final String email = Get.arguments['email'];
  // final List<String> specializations = Get.arguments['specializations'];
  final String selectedCountry =
      Get.arguments['selectedCountry'] ?? 'Select your Country';

  @override
  Widget build(BuildContext context) {
    String? previousRoute = Get.previousRoute;
    print(previousRoute);
    if (previousRoute == AppRoutes.jobTypeScreen) {
      // user came from ScreenOne
      print('User came from selected country screen');
    } else if (previousRoute == AppRoutes.speciallizationScreen) {
      // user came from ScreenTwo
    }

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70002,
            body: Stack(children: [
              SingleChildScrollView(
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 13, right: 24, bottom: 13),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              height: getSize(24),
                              width: getSize(24),
                              onTap: () {
                                onTapImgArrowleft();
                              }),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 47, right: 62),
                                  child: Text("msg_complete_your_account".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPlusJakartaSansBold24
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.12))))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 9, right: 26),
                                  child: Text("msg_lorem_ipsum_dol6".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray400
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07))))),
                          Padding(
                              padding: getPadding(top: 33),
                              child: Text("lbl_first_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.frameOneController,
                              hintText: "msg_enter_your_firs".tr,
                              margin: getMargin(top: 9),
                              padding: TextFormFieldPadding.PaddingT15),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("lbl_last_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.frameOneOneController,
                              hintText: "msg_enter_your_last".tr,
                              margin: getMargin(top: 9),
                              padding: TextFormFieldPadding.PaddingT15),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.frameOneTwoController,
                              hintText: "msg_create_a_passwo".tr,
                              margin: getMargin(top: 9),
                              padding: TextFormFieldPadding.PaddingT15_1,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: Container(
                                  margin: getMargin(
                                      left: 30, top: 14, right: 16, bottom: 14),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52))),
                          Padding(
                              padding: getPadding(top: 28),
                              child: Text("Upload your image profile",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPlusJakartaSansMedium14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  margin: getMargin(top: 7),
                                  padding: getPadding(
                                      left: 125,
                                      top: 39,
                                      right: 125,
                                      bottom: 39),
                                  decoration: AppDecoration.outlineIndigo502
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder24),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath:
                                              controller.isUploaded.value ==
                                                      false
                                                  ? ImageConstant.imgLock
                                                  : "",
                                          height: getSize(40),
                                          width: getSize(40),
                                          onTap: () {
                                            controller.uploadProfileImage();
                                          },
                                        ),
                                        Padding(
                                            padding: getPadding(
                                              top: 8,
                                            ),
                                            child: Text(
                                                controller.isUploaded.value ==
                                                        false
                                                    ? "Upload your image profile"
                                                    : "Uploaded successfully",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPlusJakartaSansSemiBold14Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0))))
                                      ]))),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Bio ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.bio,
                              hintText: "Write about you ",
                              margin: getMargin(top: 7),
                              padding: TextFormFieldPadding.PaddingT55,
                              textInputAction: TextInputAction.done,
                              maxLines: 4),
                          Container(
                              margin: getMargin(top: 16),
                              padding: getPadding(
                                  left: 16, top: 12, right: 16, bottom: 12),
                              decoration: AppDecoration.outlineIndigo50
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder24),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 5),
                                        child: Text(selectedCountry,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansMedium16Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.08)))),
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowrightGray900,
                                      height: getSize(24),
                                      width: getSize(24),
                                      margin: getMargin(top: 1, bottom: 1),
                                      onTap: () {
                                        if (isFreelancer == true) {
                                          List<String> specializations =
                                              Get.arguments['specializations'];
                                          Get.toNamed(
                                              AppRoutes.selectACountryScreen,
                                              arguments: {
                                                'isFreelancer': isFreelancer,
                                                'email': email,
                                                'specializations':
                                                    specializations,
                                              });
                                        } else {
                                           Get.toNamed(
                                            AppRoutes.selectACountryScreen,
                                            arguments: {
                                              'isFreelancer': isFreelancer,
                                              'email': email,
                                            });
                                        }

                                       
                                      },
                                    )
                                  ])),
                          CustomButton(
                              height: getVerticalSize(56),
                              text: "Continue",
                              margin: getMargin(top: 40),
                              padding: ButtonPadding.PaddingAll17,
                              fontStyle: ButtonFontStyle
                                  .PlusJakartaSansSemiBold16Gray50,
                              onTap: () {
                                onTapContinuewithemail();
                              }),
                        ])),
              ),
              Visibility(
                visible: controller.showProgressIndicator.value,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  Future<void> onTapContinuewithemail() async {
    bool situation;
   if(isFreelancer== true)  {
 List<String> specializations =Get.arguments['specializations'];
        situation = await controller.signUpWithEmailAndPasswordFreelancer(
            email: email,
            password: controller.frameOneTwoController.text.trim(),
            firstName: controller.frameOneController.text.trim(),
            lastName: controller.frameOneOneController.text.trim(),
            bio: controller.bio.text.trim(),
            country: selectedCountry,
            isFreelancer: isFreelancer,
            speciallizations: specializations);
   } else {
 situation = await controller.signUpWithEmailAndPasswordClient(
            email: email,
            password: controller.frameOneTwoController.text.trim(),
            firstName: controller.frameOneController.text.trim(),
            lastName: controller.frameOneOneController.text.trim(),
            bio: controller.bio.text.trim(),
            country: selectedCountry,
            isFreelancer: isFreelancer,
          );
   }
        
        
    if (situation == false) {
      Get.snackbar('Error', 'Error in sign up process please try later');
    } else {
      Get.offNamed(
        AppRoutes.homeContainerScreen,
      );
    }
  }

  void _onOnTapSignUpSuccess() {}

  void _onOnTapSignUpError() {
    Fluttertoast.showToast(
      msg: controller.postRegisterResp.message!.toString(),
    );
  }

  onTapTxtLogin() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
