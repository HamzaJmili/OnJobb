import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String bio,
    required String country,
    required bool isFreelancer,
  }) async {
    // Check that all required fields are not empty
    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        country.isEmpty) {
      Get.snackbar('Error', 'Please fill in all required fields');
      return false;
    }
    UserCredential? userCredential;

    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'invalid-email');
        return false;
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'email-already-in-use');
        return false;
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Weak password');
        return false;
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar('Error', 'operation-not-allowed');
        return false;
      } else if (e.code == 'network-request-failed') {
        Get.snackbar('Error', 'network-request-failed');
        return false;
      } else {
        // Handle unknown error
        return false;
      }
    }

    if (userCredential != null) {
      // Save additional user data to Firestore database
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'location': country,
        'bio': bio,
        'photoUrl': "photooo",
        'isFreelancer': isFreelancer,
        'speciallization': 'speciallization',
      });

      return true;
    }
    return false;
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
