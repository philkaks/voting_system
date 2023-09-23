import 'package:flutter/material.dart';
import 'package:voting_system/features/user/domain/entities/candidate.dart';
import 'package:voting_system/features/user/presentation/widgets/candidate_card.dart';

class CandidatesView extends StatelessWidget {
  final List<Candidate> candidates;

  const CandidatesView({super.key, required this.candidates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            return CandidateCard(candidate: candidates[index]);
          },
        ),
      ),
    );
  }
}
