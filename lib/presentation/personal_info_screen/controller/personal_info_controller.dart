import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/personal_info_screen/models/personal_info_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/data/models/me/get_me_resp.dart';
import 'package:onjobb/data/apiClient/api_client.dart';

class PersonalInfoController extends GetxController {
  TextEditingController frameOneController = TextEditingController();

  TextEditingController frameOneOneController = TextEditingController();

  TextEditingController emailOneController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController frameOneTwoController = TextEditingController();

  Rx<PersonalInfoModel> personalInfoModelObj = PersonalInfoModel().obs;

  GetMeResp getMeResp = GetMeResp();

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await this.callFetchMe();
      _onFetchMeSuccess();
    } on GetMeResp {
      _onFetchMeError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  @override
  void onClose() {
    super.onClose();
    frameOneController.dispose();
    frameOneOneController.dispose();
    emailOneController.dispose();
    mobileNoController.dispose();
    frameOneTwoController.dispose();
  }

  Future<void> callFetchMe() async {
    // try {
    //   getMeResp = await Get.find<ApiClient>().fetchMe(headers: {
    //     'Content-type': 'application/json',
    //     'Authorization':
    //         'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNmZiNzBhZWJiM2RiYjVlYmVkYTBmMiIsInVzZXJuYW1lIjoiT3Jpb24xNyIsImlhdCI6MTY3ODc3NjY2OX0.16TzzeJMkGbsT-hk-wigjBt4xeJNcwNzVvnl05evYUk',
    //   });
    //   _handleFetchMeSuccess();
    // } on GetMeResp catch (e) {
    //   getMeResp = e;
    //   rethrow;
    // }
  }

  void _handleFetchMeSuccess() {
    emailOneController.text = getMeResp.data!.email!.toString();
    frameOneController.text = getMeResp.data!.name!.toString();
  }

  void _onFetchMeSuccess() {}
  void _onFetchMeError() {}
}
