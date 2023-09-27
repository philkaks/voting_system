import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateModel {
  final String name;
  final int age;
  final String position;
  final String party;
  final String manifesto;
  final String imageUrl;
  final String currentOffice;
  final String id;
  final int votes;

  CandidateModel({
    required this.name,
    required this.age,
    required this.position,
    required this.party,
    required this.manifesto,
    required this.imageUrl,
    required this.currentOffice,
    required this.id,
    required this.votes ,
  });

  factory CandidateModel.fromFirestore(
    DocumentSnapshot snapshot,
    // SnapshotOptions? options,
  ) {
    // final data = snapshot;
    return CandidateModel(
      name: snapshot['name'] ?? '',
      age: snapshot['age']?.toInt() ?? 0,
      position: snapshot['position'] ?? '',
      party: snapshot['party'] ?? '',
      manifesto: snapshot['manifesto'] ?? '',
      imageUrl: snapshot['imageUrl'] ?? '',
      currentOffice: snapshot['currentOffice'] ?? '',
      id: snapshot['id'] ?? 0,
      votes: snapshot['votes'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'age': age,
      'position': position,
      'party': party,
      'manifesto': manifesto,
      'imageUrl': imageUrl,
      'currentOffice': currentOffice,
      'id': id,
      'votes': votes,
    };
  }
}
