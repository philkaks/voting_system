import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import '../../../../core/typography/typography.dart';

class CandidateCard extends StatefulWidget {
  final CandidateModel candidate;

  CandidateCard({Key? key, required this.candidate}) : super(key: key);
  bool isVoted = false;
  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  @override
  Widget build(BuildContext context) {
    final DocumentReference candidateRef = FirebaseFirestore.instance
        .collection('candidates')
        .doc(widget.candidate.id);

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
                  Text(widget.candidate.name, style: AppTypography.headline3),
                  const SizedBox(height: 8),
                  Text(
                    widget.candidate.party,
                    style: AppTypography.bodyText2,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Manifesto',
                    style: AppTypography.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.candidate.manifesto,
                    style: AppTypography.caption,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                        onPressed: () {
                          // candidateRef.update({
                          //   'votes': FieldValue.increment(1),
                          // });
                          // setState(() {
                          //   widget.isVoted = !widget.isVoted;
                          // });
                        },
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                
                                candidateRef.update({
                                  'votes': widget.isVoted
                                      ? FieldValue.increment(-1)
                                      : FieldValue.increment(1),
                                }).then((value) => setState(() {
                                  widget.isVoted = !widget.isVoted;
                                }));
                                
                                
                              },
                              icon: Icon(
                                Icons.thumb_up,
                                color:
                                    widget.isVoted ? Colors.blue : Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Vote'),
                          ],
                        )),
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
                    image: NetworkImage(widget.candidate.imageUrl),
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
