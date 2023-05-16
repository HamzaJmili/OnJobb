import 'controller/select_a_country_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_radio_button.dart';
import 'package:onjobb/widgets/custom_search_view.dart';

class SelectACountryScreen extends GetWidget<SelectACountryController> {
  final bool isFreelancer = Get.arguments['isFreelancer'];
  final String email = Get.arguments['email'];
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
            onTap: onTapClose,
          ),
          centerTitle: true,
          title: AppbarTitle(text: "msg_select_a_countr".tr),
        ),
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
                  margin: getMargin(left: 16, top: 17, right: 8, bottom: 17),
                  child: CustomImageView(svgPath: ImageConstant.imgSearch),
                ),
                prefixConstraints:
                    BoxConstraints(maxHeight: getVerticalSize(52)),
                suffix: Padding(
                  padding: EdgeInsets.only(right: getHorizontalSize(15)),
                  child: IconButton(
                    onPressed: () {
                      controller.frameOneController.clear();
                    },
                    icon: Icon(Icons.clear, color: Colors.grey.shade600),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.filteredCountryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomRadioButton(
                        text: controller.filteredCountryList[index],
                        value: controller.filteredCountryList[index],
                        groupValue: controller.radioGroup.value,
                        margin: getMargin(right: 68),
                        fontStyle:
                            RadioFontStyle.PlusJakartaSansSemiBold16Gray900,
                        onChange: (value) {
                          controller.radioGroup.value = value;
                          onTapClose(controller.radioGroup.value);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapClose([String? selectedCountry]) {
    if (isFreelancer == true) {
      final List<String> specializations = Get.arguments['specializations'];
      Get.toNamed(AppRoutes.signUpCompleteAccountScreen, arguments: {
        'isFreelancer': isFreelancer,
        'email': email,
        'specializations': specializations,
        'selectedCountry': selectedCountry,
      });
    } else {
      Get.toNamed(AppRoutes.signUpCompleteAccountScreen, arguments: {
        'isFreelancer': isFreelancer,
        'email': email,
        'selectedCountry': selectedCountry,
      });
    }
  }
}
