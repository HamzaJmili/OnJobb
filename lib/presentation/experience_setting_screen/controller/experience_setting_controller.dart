import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/experience_setting_screen/models/experience_setting_model.dart';

import '../../../models/Education.dart';
import '../../../models/Experience.dart';

class ExperienceSettingController extends GetxController {
  Rx<ExperienceSettingModel> experienceSettingModelObj =
      ExperienceSettingModel().obs;

  // Lists to store experiences and educations
  RxList<Experience> experiencesList = <Experience>[].obs;

  RxList<Education> educationsList = <Education>[].obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  String userid = '';

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      userid = user.uid;
    } catch (e) {
      print(e);
    }
  }

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
    await getCurrentUser();
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
