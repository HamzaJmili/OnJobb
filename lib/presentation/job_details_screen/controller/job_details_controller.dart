import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/job_details_screen/models/job_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobDetailsController extends GetxController {
  Rx<JobDetailsModel> jobDetailsModelObj = JobDetailsModel().obs;

  Future<void> saveJob(String jobId, String freelancerId) async {
    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Define the data for the new document
      Map<String, dynamic> data = {
        'jobId': jobId,
        'freelancerId': freelancerId,
      };

      // Add the document to the "savedJobs" collection
      await firestore.collection('savedJobs').add(data);

      // Document added successfully
      print('Job saved successfully!');
    } catch (error) {
      // An error occurred while adding the document
      print('Error saving job: $error');
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
