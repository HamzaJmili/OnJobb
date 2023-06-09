import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';
import 'package:onjobb/domain/googleauth/google_auth_helper.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                          padding: getPadding(top: 60),
                          child: Text("msg_hi_welcome_bac".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.12)))),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text("msg_lorem_ipsum_dol6".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .txtPlusJakartaSansMedium14Bluegray400
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.07)))),
                      // CustomButton(
                      //     height: getVerticalSize(56),
                      //     text: "msg_continue_with_g".tr,
                      //     margin: getMargin(top: 31),
                      //     variant: ButtonVariant.OutlineGray900,
                      //     padding: ButtonPadding.PaddingT17,
                      //     fontStyle: ButtonFontStyle
                      //         .PlusJakartaSansSemiBold16Gray900_1,
                      //     prefixWidget: Container(
                      //         margin: getMargin(right: 12),
                      //         child: CustomImageView(
                      //             svgPath: ImageConstant.imgGoogle)),
                      //     onTap: () {
                      //       onTapContinuewithgoogle();
                      //     }),
                      // CustomButton(
                      //     height: getVerticalSize(56),
                      //     text: "msg_continue_with_a".tr,
                      //     margin: getMargin(top: 16),
                      //     variant: ButtonVariant.OutlineGray900,
                      //     padding: ButtonPadding.PaddingT17,
                      //     fontStyle: ButtonFontStyle
                      //         .PlusJakartaSansSemiBold16Gray900_1,
                      //     prefixWidget: Container(
                      //         margin: getMargin(right: 12),
                      //         child: CustomImageView(
                      //             svgPath: ImageConstant.imgFire))),
                      Padding(
                          padding: getPadding(left: 33, top: 26, right: 33),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 8, bottom: 8),
                                    child: SizedBox(
                                        width: getHorizontalSize(62),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: Colors.white))),
                                // Padding(
                                //     padding: getPadding(left: 12),
                                //     child: Text("msg_or_continue_wit".tr,
                                //         overflow: TextOverflow.ellipsis,
                                //         textAlign: TextAlign.left,
                                //         style: AppStyle
                                //             .txtPlusJakartaSansSemiBold14Bluegray300
                                //             .copyWith(
                                //                 letterSpacing:
                                //                     getHorizontalSize(0.07)))),
                              
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(top: 28),
                              child: Text("lbl_email".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07))))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.email,
                          hintText: "msg_enter_your_emai".tr,
                          margin: getMargin(top: 9),
                          padding: TextFormFieldPadding.PaddingT15,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(top: 28),
                              child: Text("Password",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07))))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.password,
                          hintText: "Enter your password",
                          margin: getMargin(top: 9),
                          padding: TextFormFieldPadding.PaddingT15,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword),

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
                      Padding(
                          padding: getPadding(left: 41, top: 26, right: 41),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLanguage();
                                    },
                                    child: Padding(
                                        padding: getPadding(left: 2, top: 1),
                                        child: Text("lbl_sign_up".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansSemiBold16Gray900
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.08)))))
                              ])),
                      Container(
                          width: getHorizontalSize(245),
                          margin: getMargin(
                              left: 40, top: 84, right: 40, bottom: 5),
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
                                        letterSpacing: getHorizontalSize(0.07)))
                              ]),
                              textAlign: TextAlign.center))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapContinuewithgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapContinuewithemail() async {
    print('print in the top of function');
    String? userid = await controller.signInWithEmailPassword(
        controller.email.text, controller.password.text);
    if (userid == null) {
    
    } else {
      Get.toNamed(
        AppRoutes.homeContainerScreen,
      );

    }
  }

  onTapTxtLanguage() {
    Get.toNamed(
      AppRoutes.signUpCreateAcountScreen,
    );
  }
}
