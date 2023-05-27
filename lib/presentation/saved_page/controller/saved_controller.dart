import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/saved_page/models/saved_model.dart';

import '../../../models/Client.dart';
import '../../../models/Freelancer.dart';
import '../../../models/Job.dart';

class SavedController extends GetxController {
  SavedController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> userisFreelancer = true.obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  String currentuserId = '';

  final RxList<Job> jobsList = <Job>[].obs;
  final RxList<Job> savedJobsList = <Job>[].obs;

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      currentuserId = user.uid;
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
    // await getCurrentUser();

    final snapshot = await FirebaseFirestore.instance
        .collection('jobs')
        .where('idPublisher', isEqualTo: client.value?.uid)
        .get();
    for (var doc in snapshot.docs) {
      Job job = Job.fromJson(doc.id, doc.data());

      // Check if the job with the same UID already exists in jobsList
      bool isJobExists =
          jobsList.any((existingJob) => existingJob.id == job.id);

      if (!isJobExists) {
        jobsList.add(job);
      }
    }
  }

  Future<void> getSavedJobs() async {
    // await getCurrentUser();

    final savedJobsSnapshot = await FirebaseFirestore.instance
        .collection('savedJobs')
        .where('freelancerId', isEqualTo: freelancer.value?.uid)
        .get();

    for (var savedJobDoc in savedJobsSnapshot.docs) {
      String jobId = savedJobDoc.get('jobId');
      final jobSnapshot =
          await FirebaseFirestore.instance.collection('jobs').doc(jobId).get();

      if (jobSnapshot.exists && jobSnapshot.data() != null) {
        Map<String, dynamic> jobData = jobSnapshot.data()!;

        Job job = Job.fromJson(jobSnapshot.id, jobData);

        bool isJobExists =
            savedJobsList.any((existingJob) => existingJob.id == job.id);
        if (!isJobExists) {
          savedJobsList.add(job);
        }
      }
    }
  }

  Future<void> deleteFromSavedJobs(String jobId) async {
    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the documents with matching jobId and freelancerId
      QuerySnapshot querySnapshot = await firestore
          .collection('savedJobs')
          .where('jobId', isEqualTo: jobId)
          .where('freelancerId', isEqualTo: currentuserId)
          .get();

      // Delete each document in the query result
      for (DocumentSnapshot document in querySnapshot.docs) {
        await document.reference.delete();
      }

      // Job deleted successfully
      print('Job deleted successfully!');
      savedJobsList.removeWhere((job) => job.id == jobId);
    } catch (error) {
      // An error occurred while deleting the job
      print('Error deleting job: $error');
    }
  }

  Future<void> deleteClientJob(String jobId) async {
    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Construct the reference to the specific document in the "jobs" collection
      DocumentReference jobRef = firestore.collection('jobs').doc(jobId);

      // Check if the document exists
      DocumentSnapshot snapshot = await jobRef.get();
      if (snapshot.exists) {
        // Delete the document
        await jobRef.delete();
        print('Job deleted successfully!');
      } else {
        print('Job not found.');
      }
    } catch (error) {
      // An error occurred while deleting the job
      print('Error deleting job: $error');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
    getSavedJobs();
    getJobs();
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
