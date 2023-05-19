import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/models/proposal.dart';
import 'package:onjobb/presentation/apply_job_screen/models/apply_job_model.dart';

import '../../../models/Freelancer.dart';

class ApplyJobController extends GetxController {
  Rx<ApplyJobModel> applyJobModelObj = ApplyJobModel().obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController salaire = TextEditingController();

  TextEditingController coverLetter = TextEditingController();

  TextEditingController portfolio = TextEditingController();

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      final docSnapshot = await userDocRef.get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      freelancer.value = Freelancer.fromJson(docSnapshot.id, data);
    } catch (e) {
      print("error in getCureent user in apply job controller : $e");
    }
  }

  Future<bool> addProposal(String jobid) async {
    // Example type, modify according to your needs
    double salary = double.tryParse(salaire.text) ?? 0.0;

    if (coverLetter.text.isEmpty || salaire.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all the fields');
      return false;
    }
    phoneNumber.text.isEmpty ? phoneNumber.text = 'no' : phoneNumber.text;
    portfolio.text.isEmpty ? portfolio.text = 'no' : portfolio.text;
    try {
      Freelancer? freelancer2 = freelancer.value;
      Proposal proposal = Proposal(
          id: "id",
          jobId: jobid,
          portfolio: portfolio.text,
          freelancer: freelancer2!,
          coverLetter: coverLetter.text,
          phoneNumber: phoneNumber.text,
          salary: salary,
          sendAt: Timestamp.now());
      // CollectionReference proposalsCollection =
     await FirebaseFirestore.instance.collection('proposals').add(proposal.toMap());
      print(" print after collection ref");
      // await proposalsCollection.add({
      //   'jobId': jobid,
      //   'phoneNumber': phoneNumber,
      //   'coverLetter': coverLetter.text,
      //   'sendAt': DateTime.now(),
      //   'portfolio': portfolio,
      //   'firstName': freelancer2.toMap(),
      //   'salary': salary,
      // });
      print(" print after add to collection");

      // Clear the text fields after adding the job
      portfolio.clear();
      salaire.clear();
      coverLetter.clear();
      phoneNumber.clear();

      print('Proposal added successfully!');
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
