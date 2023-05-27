import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/home_page/models/home_model.dart';
import 'package:onjobb/models/Client.dart';
import 'package:onjobb/models/Freelancer.dart';

import '../../../models/Job.dart';

class HomeController extends GetxController {
  HomeController(this.homeModelObj);
  TextEditingController searchText = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> userisFreelancer = true.obs;
  Rx<bool> isLoading = true.obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  String userid = '';
  List<Job> jobsList = [];
  List<Client> clientList = [];
  List<Freelancer> freelancersList = [];
  var filteredJobsList = [].obs;
  var filteredFreelancersList = [].obs;

  var searchValue = "".obs;

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

// Future<List<Freelancer>>
  Future<void> getFreelancers() async {
    // List<Freelancer> freelancersList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isFreelancer', isEqualTo: true)
        .get();

    for (var doc in snapshot.docs) {
      Freelancer freelancer = Freelancer.fromJson(doc.id, doc.data());
      freelancersList.add(freelancer);
    }
    // return freelancersList;
  }

//  Future<List<Job>>
  Future<void> getJobs() async {
    // List<Job> jobsList = [];
    final snapshot = await FirebaseFirestore.instance.collection('jobs').get();
    for (var doc in snapshot.docs) {
      Job job = Job.fromJson(doc.id, doc.data());
      jobsList.add(job);
    }
    // return jobsList;
  }

  Future<Client?> getClientById(String idPublisher) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('clients')
        .doc(idPublisher)
        .get();

    if (snapshot.exists) {
      var data = snapshot.data();
      return Client.fromJson(snapshot.id, data!);
    } else {
      // Handle the case where the client does not exist
      return null;
    }
  }

  getJobsAndClient() async {
    // jobsList = await getJobs();
    // freelancersList = await getFreelancers();
    for (var job in jobsList) {
      Client? client = await getClientById(job.idPublisher);
      if (client != null) {
        clientList.add(client);
      }
    }
    isLoading.value = false;
  }

  Client? searchClient(String id) {
    for (var client in clientList) {
      if (client.uid == id) return client;
    }
    return null;
  }

  Rx<HomeModel> homeModelObj;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
    getJobs();
    await getFreelancers();
    await getJobs();
    getJobsAndClient();
    filteredJobsList.value = jobsList;
    filteredFreelancersList.value = freelancersList;
    searchValue.listen((value) {
      filterList(value);
    });
    searchText.addListener(() {
      filterList(searchText.text);
    });
  }

  void filterList(String value) {
    if(userisFreelancer.value) { 
 if (value.isEmpty) {
      filteredJobsList.value = jobsList;
      return;
    }
    filteredJobsList.value = jobsList
        .where((job) => job.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    } else {
 if (value.isEmpty) {
      filteredFreelancersList.value = freelancersList;
      return;
    }
    filteredFreelancersList.value = freelancersList
        .where((freelancer) =>  freelancer.lastname.toLowerCase().contains(value.toLowerCase()) || freelancer.firstname.toLowerCase().contains(value.toLowerCase())) 
        .toList();
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
