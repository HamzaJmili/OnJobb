import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

import '../models/publish_job_model.dart';

class PublishJobController extends GetxController {
  Rx<PublishJobModel> PublishJobModelObj = PublishJobModel().obs;

  Rx<String> selectedJobType = "on-site".obs;

  TextEditingController title = TextEditingController();

  TextEditingController maxSalary = TextEditingController();

  TextEditingController minSalary = TextEditingController();

  TextEditingController description = TextEditingController();

  Future<bool> addJob(String uid, String fullName, String imageUrl ) async {
    // Example type, modify according to your needs
    double jobMinSalary = double.tryParse(minSalary.text) ?? 0.0;
    double jobMaxSalary = double.tryParse(maxSalary.text) ?? 0.0;
    if (jobMinSalary > jobMaxSalary) {
      Get.snackbar('Error', 'Min salary can \'t be greater than Max salary');
      return false;
    }
    if (description.text.isEmpty ||
        title.text.isEmpty ||
        minSalary.text.isEmpty ||
        maxSalary.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all the fields');
      return false;
    }
    try {
      CollectionReference jobsCollection =
          FirebaseFirestore.instance.collection('jobs');
      print(" print after collection ref");
      await jobsCollection.add({
        'idPublisher': uid,
        'title': title.text,
        'jobDescription': description.text,
        'fullName' :  fullName,
         'ImageUrl' : imageUrl ,
        'publishedAt': DateTime.now(),
        'type': selectedJobType.value,
        'minSalary': jobMinSalary,
        'maxSalary': jobMaxSalary,
      });
      print(" print after add to collection");

      // Clear the text fields after adding the job
      title.clear();
      maxSalary.clear();
      minSalary.clear();
      description.clear();

      print('Job added successfully!');
    } catch (e) {
      print('print in catch');
      return false;
     
    }
    return true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
