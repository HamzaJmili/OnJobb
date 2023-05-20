import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/saved_page/models/saved_model.dart';

import '../../../models/Client.dart';
import '../../../models/Freelancer.dart';
import '../../../models/Job.dart';

class SavedController extends GetxController {
  SavedController(this.savedModelObj);

  Rx<SavedModel> savedModelObj;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> userisFreelancer = true.obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  // List<Job> jobsList = [];

  final RxList<Job> jobsList = <Job>[].obs;
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

  Future<void> getJobs() async {
    await getCurrentUser();
    
    final snapshot = await FirebaseFirestore.instance
        .collection('jobs')
        .where('idPublisher', isEqualTo: client.value?.uid)
        .get();
  for (var doc in snapshot.docs) {

  Job job = Job.fromJson(doc.id, doc.data());

  // Check if the job with the same UID already exists in jobsList
  bool isJobExists = jobsList.any((existingJob) => existingJob.id == job.id);

  if (!isJobExists) {
    jobsList.add(job);
  }
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
