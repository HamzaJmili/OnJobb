import 'package:cloud_firestore/cloud_firestore.dart';

class Experience {
  String idFreelancer;
  String title;
  String companyName;
  String location;
  DateTime startDate;
  DateTime endDate;

  Experience({
    required this.idFreelancer,
    required this.title,
    required this.companyName,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> data) {
    
    return Experience(
      idFreelancer: data['idFreelancer'],
      title: data['title'],
      companyName: data['companyName'],
      location: data['location'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idFreelancer': idFreelancer,
      'title': title,
      'companyName': companyName,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
