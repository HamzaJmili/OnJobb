import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/add_new_education_screen/models/add_new_education_model.dart';
import 'package:flutter/material.dart';

class AddNewEducationController extends GetxController {
  TextEditingController school = TextEditingController();

  TextEditingController fieldOfStudy = TextEditingController();

  TextEditingController frameOneThreeController = TextEditingController();

  TextEditingController frameOneFourController = TextEditingController();

  Rx<AddNewEducationModel> addNewEducationModelObj = AddNewEducationModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  String selectedDregee = '';

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

  void addEducation() {
    // Check if any of the fields are empty
    if (school.text.isEmpty ||
        fieldOfStudy.text.isEmpty ||
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

    FirebaseFirestore.instance.collection('educations').add({
      'idFreelancer': userid,
      'school': school.text,
      'fieldOfStudy': fieldOfStudy.text,
      'degree': selectedDregee,
      'startDate': Timestamp.fromDate(startDate.value!),
      'endDate': Timestamp.fromDate(endDate.value!),
    }).then((value) {
      print('Experience added successfully!');
      school.clear();
      fieldOfStudy.clear();
      startDate.value = null;
      endDate.value = null;
    }).catchError((error) => print('Failed to add experience: $error'));
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
    school.dispose();
    fieldOfStudy.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    addNewEducationModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        selectedDregee = element.title;
      }
    });
    addNewEducationModelObj.value.dropdownItemList.refresh();
  }
}
