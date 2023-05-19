import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String id;
  String title;
  String jobDescription;
  Timestamp publishedAt;
  String fullName;
  String imageUrl;
  String type;
  double minSalary;
  double maxSalary;
  String idPublisher;

  Job({
    required this.id,
    required this.idPublisher,
    required this.title,
    required this.jobDescription,
    required this.publishedAt,
    required this.fullName,
    required this.imageUrl,
    required this.type,
    required this.minSalary,
    required this.maxSalary,
  });

  factory Job.fromJson(String id, Map<String, dynamic> data) {
    return Job(
      id: id,
      idPublisher: data['idPublisher'],
      title: data['title'],
      jobDescription: data['jobDescription'],
      fullName: data['fullName'],
      imageUrl: data['ImageUrl'],
      publishedAt: data['publishedAt'],
      type: data['type'],
      minSalary: data['minSalary'],
      maxSalary: data['maxSalary'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPublisher': idPublisher,
      'title': title,
      'jobDescription': jobDescription,
      'publishedAt': publishedAt,
       'fullname' : fullName,
       'imageUrl' : imageUrl ,
      'type': type,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
    };
  }
}
