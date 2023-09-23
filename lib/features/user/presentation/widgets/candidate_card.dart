import 'package:flutter/material.dart';
import 'package:voting_system/features/user/domain/entities/candidate.dart';

import '../../../../core/typography/typography.dart';

class CandidateCard extends StatelessWidget {
  final Candidate candidate;

  const CandidateCard({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(candidate.name, style: AppTypography.headline3),
                  const SizedBox(height: 8),
                  Text(
                    candidate.party,
                    style: AppTypography.bodyText2,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Manifesto',
                    style: AppTypography.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    candidate.manifesto,
                    style: AppTypography.caption,
                  ),
                  const SizedBox(height: 16),
                  Chip(
                    avatar: const Icon(
                      Icons.thumb_up,
                    ),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: const Text('Vote',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(candidate.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
