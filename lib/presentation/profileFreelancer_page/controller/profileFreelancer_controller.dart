import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/models/Freelancer.dart';

import '../../../models/Education.dart';
import '../../../models/Experience.dart';
import '../models/profileFreelancer_model.dart';

class ProfileFreelancerController extends GetxController {
  ProfileFreelancerController(this.profileFreelancerModelObj);

  Rx<ProfileFreelancerModel> profileFreelancerModelObj;

  final FirebaseAuth auth = FirebaseAuth.instance;

  String userid = '';
  Rx<String> radioGroup = "".obs;
  RxList<Experience> experiencesList = <Experience>[].obs;
  RxList<Education> educationsList = <Education>[].obs;



  // Function to retrieve experiences and educations
  Future<void> getAllData() async {
    try {
      final experienceSnapshot = await FirebaseFirestore.instance
          .collection('experiences')
          .where('idFreelancer', isEqualTo: userid)
          .get();

      experiencesList.value = experienceSnapshot.docs
          .map((doc) => Experience.fromJson(doc.data()))
          .toList();
      final educationSnapshot = await FirebaseFirestore.instance
          .collection('educations')
          .where('idFreelancer', isEqualTo: userid)
          .get();

      educationsList.value = educationSnapshot.docs
          .map((doc) => Education.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  @override
  void onInit() async {
    super.onInit();
   
    Freelancer freelancer = Get.arguments;
    userid = freelancer.uid;
     await getAllData();
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
