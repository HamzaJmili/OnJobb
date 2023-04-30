import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/select_a_country_screen/models/select_a_country_model.dart';
import 'package:flutter/material.dart';

class SelectACountryController extends GetxController {
  TextEditingController frameOneController = TextEditingController();

  Rx<SelectACountryModel> selectACountryModelObj = SelectACountryModel().obs;

  Rx<String> radioGroup = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    frameOneController.dispose();
  }
}
