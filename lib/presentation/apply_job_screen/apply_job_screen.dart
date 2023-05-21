import '../../models/Job.dart';
import '../../widgets/custom_text_form_field.dart';
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
  ApplyJobController controller = Get.put(ApplyJobController());

  final Job job = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.getCurrentUser();

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
                                margin: getMargin(top: 26),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          "You can Add your phone Number (optional)",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPlusJakartaSansMedium14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(0.07))),
                                      CustomTextFormField(
                                          focusNode: FocusNode(),
                                          controller: controller.phoneNumber,
                                          hintText: "Your phone number",
                                          margin: getMargin(top: 14),
                                          padding:
                                              TextFormFieldPadding.PaddingT15),
                                      Align(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 15),
                                              child: Text(
                                                'salary',
                                              ),
                                            ),
                                            CustomTextFormField(
                                              focusNode: FocusNode(),
                                              controller: controller.salaire,
                                              hintText: 'salary',
                                              margin: getMargin(top: 9),
                                              padding: TextFormFieldPadding
                                                  .PaddingT15,
                                              textInputAction:
                                                  TextInputAction.done,
                                              textInputType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]))),
                        Padding(
                            padding: getPadding(top: 28),
                            child: Text(
                                "Cover letter : write at least 345 caracteres ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPlusJakartaSansMedium14
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.07)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: controller.coverLetter,
                            hintText: "write to the Client ",
                            margin: getMargin(
                              top: 20,
                              bottom: 12,
                            ),
                            padding: TextFormFieldPadding.PaddingT55,
                            textInputAction: TextInputAction.done,
                            maxLines: 4),
                        Text("${"msg_website_blog".tr}(optional)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPlusJakartaSansMedium14.copyWith(
                                letterSpacing: getHorizontalSize(0.07))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: controller.portfolio,
                            hintText: "Https://",
                            margin: getMargin(top: 14),
                            padding: TextFormFieldPadding.PaddingT15),
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

 bool a= await controller.addProposal(job.id);

 if(a==true) {
   Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: ApplyJobPopupDialog(
        Get.put(
          ApplyJobPopupController(),
        ),
      ),
    ));
 }
   
  }

  onTapArrowleft7() {
    Get.back();
  }
}
