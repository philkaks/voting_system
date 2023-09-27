import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import 'package:voting_system/features/user/presentation/widgets/candidate_card.dart';
import '../../data/repositories_implementation/repo_implemtation.dart';

// ignore: must_be_immutable
class CandidatesView extends StatelessWidget {
  UserRepositoryImplementation repo = UserRepositoryImplementation();

  CandidatesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                    backgroundColor: Colors.blue,
                    selectedColor: Colors.red,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.blue),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text(
                      'President',
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: false,
                    onSelected: (value) {}),
                const SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                    // backgroundColor: Colors.blueGrey,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.blue),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text('Vice-President'),
                    selected: false,
                    onSelected: (value) {}),
                const SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.blue),
                    avatar: const Icon(Icons.person_4_rounded),
                    label: const Text('Prime Minister'),
                    selected: false,
                    onSelected: (value) {}),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: FutureBuilder<List<CandidateModel>>(
                    future: repo.getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CandidateModel>> snapshot) {
                      if (snapshot.hasData) {
                        // print('has data..........................');
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CandidateCard(
                                candidate: snapshot.data![index]);
                          },
                        );
                      } else {
                        // print('no data');
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
