import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import 'package:voting_system/features/user/presentation/widgets/candidate_card.dart';
import '../../data/repositories_implementation/repo_implemtation.dart';


// ignore: must_be_immutable
class CandidatesView extends StatelessWidget {
  UserRepositoryImplementation repo =
      UserRepositoryImplementation();

  CandidatesView({
    super.key,
  });


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates List'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FutureBuilder<List<CandidateModel>>(
            future: repo.getData(),
            builder: (BuildContext context,AsyncSnapshot<List<CandidateModel>> snapshot) {
              
              if (snapshot.hasData ) {
                // print('has data..........................');
                return ListView.builder(
                  itemCount:snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CandidateCard(candidate: snapshot.data![index]);
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
    );
  }
}



    









      

















    