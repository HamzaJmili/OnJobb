import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/profile_page/models/profile_model.dart';
import 'package:onjobb/models/Client.dart';
import 'package:onjobb/models/Freelancer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

 Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
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


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
