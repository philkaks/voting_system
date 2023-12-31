import 'package:equatable/equatable.dart';
class Candidate extends Equatable{
  final String name;
  final int age;
  final String position;
  final String party;
  final String manifesto;
  final String imageUrl;
  final String currentOffice;
  final String id;
  final int votes;

 const Candidate({
    required this.name,
    required this.age,
    required this.position,
    required this.party,
    required this.manifesto,
    required this.currentOffice,
    required this.imageUrl,
    required this.id,
    required this.votes,
  });

  @override
  List<Object?> get props => [name, age, position, party, manifesto, currentOffice, imageUrl, id, votes];
}
