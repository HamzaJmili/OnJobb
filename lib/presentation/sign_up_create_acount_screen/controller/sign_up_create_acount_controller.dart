import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/sign_up_create_acount_screen/models/sign_up_create_acount_model.dart';
import 'package:flutter/material.dart';

class SignUpCreateAcountController extends GetxController {
  TextEditingController email = TextEditingController();

  Rx<SignUpCreateAcountModel> signUpCreateAcountModelObj =
      SignUpCreateAcountModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
