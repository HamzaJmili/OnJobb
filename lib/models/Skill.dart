import 'package:cloud_firestore/cloud_firestore.dart';

class Skill {
  String id;
  String name;

  Skill({required this.id, required this.name});

factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
  factory Skill.fromDocumentSnapshot(DocumentSnapshot snapshot) {
Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Skill(
      id: snapshot.id,
      name: data['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
