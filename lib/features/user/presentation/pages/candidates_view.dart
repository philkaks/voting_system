import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import 'package:voting_system/features/user/presentation/pages/profile.dart';
import 'package:voting_system/features/user/presentation/pages/voting_guidlines.dart';
import 'package:voting_system/features/user/presentation/widgets/candidate_card.dart';
import '../../data/repositories_implementation/repo_implemtation.dart';

class CandidatesView extends StatefulWidget {
  const CandidatesView({
    super.key,
  });

  @override
  State<CandidatesView> createState() => _CandidatesViewState();
}

class _CandidatesViewState extends State<CandidatesView> {
  UserRepositoryImplementation repo = UserRepositoryImplementation();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const VotingGuidlines();
                }));
              },
              icon: const Icon(Icons.how_to_vote_rounded)),

          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Profile();
                }));
              },
              icon: const Icon(Icons.person_3)),
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/result');
          //     },
          //     icon: const Icon(Icons.bar_chart_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                    selectedColor: Colors.blue[200],
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.blue),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text(
                      'President',
                    ),
                    selected: selectedIndex == 0,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                    selectedColor: Colors.blue[200],
                    shape: const StadiumBorder(),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text('Vice-President'),
                    selected: selectedIndex == 1,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                    selectedColor: Colors.blue[200],
                    shape: const StadiumBorder(),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text('Prime Minister'),
                    selected: selectedIndex == 2,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = 2;
                      });
                    }),
              ],
            ),
            if (selectedIndex == 0) ...[
              // Display widgets for President
              fetchCandidates(context)
            ] else if (selectedIndex == 1) ...[
              // Display widgets for Vice-President
              fetchCandidates(context)
            ] else if (selectedIndex == 2) ...[
              // Display widgets for Prime Minister
              Text ('Prime Minister')
            ],
          ],
        ),
      ),
    );
  }

  SizedBox fetchCandidates(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FutureBuilder<List<CandidateModel>>(
            future: repo.getData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CandidateModel>> snapshot) {
              if (snapshot.hasData) {
                  return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CandidateCard(candidate: snapshot.data![index], );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
