import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/sign_up_complete_account_screen/models/sign_up_complete_account_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/data/models/register/post_register_resp.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCompleteAccountController extends GetxController {
  TextEditingController frameOneController = TextEditingController();

  TextEditingController frameOneOneController = TextEditingController();

  TextEditingController frameOneTwoController = TextEditingController();

  TextEditingController bio = TextEditingController();

  String imageUrl = "";

  Rx<bool> isUploaded = false.obs;

  Rx<SignUpCompleteAccountModel> signUpCompleteAccountModelObj =
      SignUpCompleteAccountModel().obs;

  PostRegisterResp postRegisterResp = PostRegisterResp();

  Rx<bool> showProgressIndicator = false.obs;

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

  Future<bool> uploadProfileImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        print("Upload image to Firebase storage");
        // Upload image to Firebase storage
        final storageRef = FirebaseStorage.instance.ref().child(
            'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final uploadTask = storageRef.putFile(File(pickedFile.path));
        await uploadTask.whenComplete(() {});

        // Get the download URL of the uploaded image
        imageUrl = await storageRef.getDownloadURL();
        print("\n");
        print("\n");
        print(" this is image url : $imageUrl ");
        print("\n");
        print("\n");
        // Set the photoUrl property of the user object
        isUploaded.value = true;
        return true;
      }
    } catch (e) {
      print("the error in uploading image is $e");
      return false;
    }
    return false;
  }

  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String bio,
    required String country,
    required bool isFreelancer,
    required List<String> speciallizations,
  }) async {
    showProgressIndicator.value = true;

    // Check that all required fields are not empty
    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        bio.isEmpty ||
        country == 'Select your Country') {
      Get.snackbar('Error', 'Please fill in all required fields');
          showProgressIndicator.value = false;

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
    showProgressIndicator.value = false;

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
        showProgressIndicator(false);
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
        'photoUrl': imageUrl,
        'isFreelancer': isFreelancer,
        'speciallization': speciallizations,
      });
                showProgressIndicator.value = false;

      return true;
    }
              showProgressIndicator.value = false;

    return false;
  }
}
