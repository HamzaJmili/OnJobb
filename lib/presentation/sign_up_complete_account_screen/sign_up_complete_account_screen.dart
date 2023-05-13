import 'controller/sign_up_complete_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SignUpCompleteAccountScreen
    extends GetWidget<SignUpCompleteAccountController> {
  final bool isFreelancer = Get.arguments['isFreelancer'];
  final String email = Get.arguments['email'];
  final String selectedCountry =
      Get.arguments['selectedCountry'] ?? 'Select a Country';

  @override
  Widget build(BuildContext context) {
    print(selectedCountry);
    String? previousRoute = Get.previousRoute;
    print(previousRoute);
    if (previousRoute == AppRoutes.selectACountryScreen) {
      // user came from ScreenOne
      print('User came from selected country screen');
    } else if (previousRoute == AppRoutes.signUpCreateAcountScreen) {
      // user came from ScreenTwo
      print('User came from Sign create account screen');
    }

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70002,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
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
                              padding: getPadding(top: 47, right: 15),
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
                              padding: getPadding(top: 9),
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
                                      letterSpacing: getHorizontalSize(0.07)))),
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
                                      letterSpacing: getHorizontalSize(0.07)))),
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
                                      letterSpacing: getHorizontalSize(0.07)))),
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
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52))),
                      Container(
                          margin: getMargin(top: 16),
                          padding: getPadding(
                              left: 16, top: 12, right: 16, bottom: 12),
                          decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 5),
                                    child: Text("msg_select_a_countr2".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium16Gray900
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray900,
                                  height: getSize(24),
                                  width: getSize(24),
                                  margin: getMargin(top: 1, bottom: 1),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.selectACountryScreen,
                                        arguments: {
                                          'isFreelancer': isFreelancer,
                                          'email': email,
                                        });
                                  },
                                )
                              ])),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "msg_continue_with_e".tr,
                          margin: getMargin(top: 40),
                          padding: ButtonPadding.PaddingAll17,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                          onTap: () {
                            onTapContinuewithemail();
                          }),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 40, top: 28, right: 40),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("msg_already_have_an2".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtLogin();
                                        },
                                        child: Padding(
                                            padding: getPadding(left: 3),
                                            child: Text("lbl_login".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPlusJakartaSansSemiBold16Gray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.08)))))
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: getHorizontalSize(245),
                              margin: getMargin(
                                  left: 40, top: 19, right: 40, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_by_signing_up_y2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.blueGray400,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing:
                                                getHorizontalSize(0.07))),
                                    TextSpan(
                                        text: "lbl_terms".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing:
                                                getHorizontalSize(0.07))),
                                    TextSpan(
                                        text: "lbl_and".tr,
                                        style: TextStyle(
                                            color: ColorConstant.blueGray400,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing:
                                                getHorizontalSize(0.07))),
                                    TextSpan(
                                        text: "msg_conditions_of_u".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing:
                                                getHorizontalSize(0.07)))
                                  ]),
                                  textAlign: TextAlign.center)))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  Future<void> onTapContinuewithemail() async {
    bool? situation = await controller.signUpWithEmailAndPassword(
        email: email,
        password: controller.frameOneTwoController.text.trim(),
        firstName: controller.frameOneController.text.trim(),
        lastName: controller.frameOneOneController.text.trim(),
        bio: 'hi i am software Devlepoer',
        country: 'morocco',
        isFreelancer: isFreelancer);
    if (situation == false) {
      print(
          "error in ontaopcontinuewith email in sign up complete account screen");
    } else {
      Get.offNamed(
        AppRoutes.homeContainerScreen,
      );
    }

    // PostRegisterReq postRegisterReq = PostRegisterReq(
    //   username: controller.frameOneOneController.text,
    //   password: controller.frameOneTwoController.text,
    //   email: User.email,
    //   name: controller.frameOneController.text,
    //   role: Role.user,
    // );
    // try {
    //   await controller.callCreateRegister(
    //     postRegisterReq.toJson(),
    //   );
    //   _onOnTapSignUpSuccess();
    // } on PostRegisterResp {
    //   _onOnTapSignUpError();
    // } on NoInternetException catch (e) {
    //   Get.rawSnackbar(message: e.toString());
    // } catch (e) {
    //   //TODO: Handle generic errors
    // }
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
