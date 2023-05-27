import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/profile_page/models/profile_model.dart';
import 'package:onjobb/models/Client.dart';
import 'package:onjobb/models/Freelancer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/Education.dart';
import '../../../models/Experience.dart';

class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  Rx<ProfileModel> profileModelObj;

  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> userisFreelancer = true.obs;
  Rx<bool> isLoading = true.obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  String userid = '';
  Rx<String> radioGroup = "".obs;
  RxList<Experience> experiencesList = <Experience>[].obs;
  RxList<Education> educationsList = <Education>[].obs;

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      userid = user.uid;
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      final docSnapshot = await userDocRef.get();
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      if (data['isFreelancer'] == false) {
        client.value = Client.fromJson(docSnapshot.id, data);
        userisFreelancer.value = false;
      } else if (data['isFreelancer'] == true) {
        freelancer.value = Freelancer.fromJson(docSnapshot.id, data);

        userisFreelancer.value = true;
      }
    } catch (e) {
      print(e);
    }
  }
  // Lists to store experiences and educations

  // Function to retrieve experiences and educations
  Future<void> getAllData() async {
    try {
      print(" user id is : $userid");
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
