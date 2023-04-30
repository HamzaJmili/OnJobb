import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/sign_up_complete_account_screen/models/sign_up_complete_account_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/data/models/register/post_register_resp.dart';
import 'package:onjobb/data/apiClient/api_client.dart';

class SignUpCompleteAccountController extends GetxController {
  TextEditingController frameOneController = TextEditingController();

  TextEditingController frameOneOneController = TextEditingController();

  TextEditingController frameOneTwoController = TextEditingController();

  Rx<SignUpCompleteAccountModel> signUpCompleteAccountModelObj =
      SignUpCompleteAccountModel().obs;

  PostRegisterResp postRegisterResp = PostRegisterResp();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    frameOneController.dispose();
    frameOneOneController.dispose();
    frameOneTwoController.dispose();
  }

  Future<void> callCreateRegister(Map req) async {
    try {
      postRegisterResp = await Get.find<ApiClient>().createRegister(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleCreateRegisterSuccess();
    } on PostRegisterResp catch (e) {
      postRegisterResp = e;
      rethrow;
    }
  }

  void _handleCreateRegisterSuccess() {
    Get.find<PrefUtils>().setId(postRegisterResp.data!.id!.toString());
  }
}
