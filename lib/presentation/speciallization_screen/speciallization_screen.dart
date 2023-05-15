import 'package:onjobb/presentation/speciallization_screen/controller/speciallization_controller.dart';

import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_search_view.dart';

import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/presentation/confirmation_dialog/confirmation_dialog.dart';
import 'package:onjobb/presentation/confirmation_dialog/controller/confirmation_controller.dart';

class SpeciallizationScreen extends GetWidget<SpeciallizationController> {
  final bool isFreelancer = Get.arguments['isFreelancer'];
  final String email = Get.arguments['email'];
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
                      CustomSearchView(
                        focusNode: FocusNode(),
                        controller: controller.searchtext,
                        hintText: "lbl_search".tr,
                        margin: getMargin(top: 12),
                        prefix: Container(
                          margin: getMargin(
                              left: 16, top: 17, right: 8, bottom: 17),
                          child:
                              CustomImageView(svgPath: ImageConstant.imgSearch),
                        ),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(52)),
                        suffix: Padding(
                          padding:
                              EdgeInsets.only(right: getHorizontalSize(15)),
                          child: IconButton(
                            onPressed: () {
                              controller.searchtext.clear();
                            },
                            icon:
                                Icon(Icons.clear, color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount:
                                controller.filteredSpecializationList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomRadioButton(
                                text: controller
                                    .filteredSpecializationList[index],
                                value: controller
                                    .filteredSpecializationList[index],
                                groupValue: controller.radioGroup.value,
                                margin: getMargin(right: 68),
                                fontStyle: RadioFontStyle
                                    .PlusJakartaSansSemiBold16Gray900,
                                
                                onChange: (value) {
                              controller.addSpecialization(value);
},
                              );
                            },
                          ),
                        ),
                      ),
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
    List<String> specializationList = controller.selectedSpecializationList.map((e) => e.toString()).toList();
    for(int i= 0 ; i < specializationList.length ; i++ ) {
      print(specializationList[i]);
    }
   Get.toNamed(AppRoutes.signUpCompleteAccountScreen, arguments: {
      'isFreelancer': isFreelancer,
      'email': email,
      'specializations' : specializationList ,
    });
  }
}
