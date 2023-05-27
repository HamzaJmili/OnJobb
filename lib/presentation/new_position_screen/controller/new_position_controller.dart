import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/new_position_screen/models/new_position_model.dart';
import 'package:flutter/material.dart';

class NewPositionController extends GetxController {
  TextEditingController jobTitle = TextEditingController();

  TextEditingController companyName = TextEditingController();

  TextEditingController countryName = TextEditingController();

   Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  final FirebaseAuth auth = FirebaseAuth.instance;

  Rx<bool> isLoading = true.obs;

  String userid = '';

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      userid = user.uid;
    } catch (e) {
      print(e);
    }
  }

  void addExperience() {
    // Check if any of the fields are empty
    if (jobTitle.text.isEmpty ||
        companyName.text.isEmpty ||
        countryName.text.isEmpty ||
        startDate.value == null ||
        endDate.value == null) {
      // Show a snackbar or display an error message
      showSnackbar('Please fill in all fields');
      return;
    }

    // Check if the start date is greater than the end date
    if (startDate.value!.isAfter(endDate.value!)) {
      // Show a snackbar or display an error message
      showSnackbar('Start date must be before the end date');
      return;
    }

FirebaseFirestore.instance
    .collection('experiences')
    .add({
      'idFreelancer': userid,
      'title': jobTitle.text,
      'companyName': companyName.text,
      'location': countryName.text,
      'startDate': Timestamp.fromDate(startDate.value!),
      'endDate': Timestamp.fromDate(endDate.value!),
    })
    .then((value) {
      print('Experience added successfully!');
      jobTitle.clear();
      companyName.clear();
      countryName.clear();
      startDate.value = null;
      endDate.value = null;
    })
    .catchError((error) => print('Failed to add experience: $error'));
   
  }

  void showSnackbar(String message) {
    // Show a snackbar or display an error message on top
    // You can use a state management solution like GetX, Provider, or setState to handle this
    // Example using GetX:
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
    );
  }

  Rx<NewPositionModel> newPositionModelObj = NewPositionModel().obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    jobTitle.dispose();
    companyName.dispose();
    countryName.dispose();
  }
}
