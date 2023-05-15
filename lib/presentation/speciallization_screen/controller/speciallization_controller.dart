import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/speciallization_screen/models/speciallization_model.dart';
import 'package:flutter/material.dart';

class SpeciallizationController extends GetxController {
  TextEditingController searchtext = TextEditingController();

  Rx<SpeciallizationModel> speciallizationModelObj = SpeciallizationModel().obs;
  Rx<String> radioGroup = "".obs;

  var selectedSpecializationList = [].obs;
  var filteredSpecializationList = [].obs;
  var searchText = "".obs;

  void addSpecialization(String specialization) {
    if (!selectedSpecializationList.contains(specialization)) {
      if (selectedSpecializationList.length >= 3) {
        selectedSpecializationList.removeAt(0);
      }
      selectedSpecializationList.add(specialization);
    } else {
      print("already checked this specialization");
    }
    for(int i= 0 ; i < selectedSpecializationList.length ; i++ ) {
      print(selectedSpecializationList[i]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    filteredSpecializationList.value = specializations;
    searchText.listen((value) {
      filterList(value);
    });
    searchtext.addListener(() {
      filterList(searchtext.text);
    });
  }

  filterList(String value) {
    if (value.isEmpty) {
      filteredSpecializationList.value = specializations;
      return;
    }
    filteredSpecializationList.value = specializations
        .where((specialization) =>
            specialization.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<String> specializations = [
    "Web development",
    "Mobile app development",
    "Graphic design",
    "Video editing",
    "Content writing",
    "Copywriting",
    "Social media management",
    "Search engine optimization (SEO)",
    "Data entry",
    "Virtual assistance",
    "Project management",
    "Accounting",
    "Legal services",
    "Translation",
    "Customer service",
    "Sales",
    "Marketing",
    "Consulting",
    "Photography",
    "Illustration",
    "Animation",
    "Game development",
    "UI/UX design",
    "3D modeling",
    "Architecture",
    "Interior design",
    "Audio production",
    "Voiceover",
    "Scriptwriting",
    "Research",
    "Teaching/Tutoring",
    "Event planning",
    "Human resources",
    "IT support",
    "Networking",
    "Security",
    "Blockchain development",
    "Artificial intelligence/machine learning",
    "IoT development",
    "Robotics",
    "Cloud computing",
  ];
}
