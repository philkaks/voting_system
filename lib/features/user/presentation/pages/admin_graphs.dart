import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../data/models/candidate_model.dart';
import 'admin_add_candidate.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    super.initState();
    _fetchCandidatesByOffice('presido');
  }

  List<CandidateModel> candidatesPresident = [];
  List<CandidateModel> vicePresident = [];

  Future<void> _fetchCandidatesByOffice(
    String office,
  ) async {
    final candidatesCollection =
        FirebaseFirestore.instance.collection('candidates');
    final candidatesSnapshot =
        await candidatesCollection.where('position', isEqualTo: office).get();
    final candidatesData = candidatesSnapshot.docs
        .map((doc) => CandidateModel.fromFirestore(doc))
        .toList();
    setState(() {
      candidatesPresident = candidatesData;
    });
  }

  List<charts.Series<CandidateModel, String>> _createData(
      List<CandidateModel> candidates) {
    return [
      charts.Series<CandidateModel, String>(
        id: 'Votes',
        domainFn: (CandidateModel candidate, _) => candidate.name,
        measureFn: (CandidateModel candidate, _) => candidate.votes,
        data: candidates,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Charts'),
          actions: [
            // ! why is it causing an error
            // Text(
            //   'PRESIDENT CANDIADATEs: ${candidatesPresident.first.position}',
            //   style: const TextStyle(fontSize: 15),
            // ),
            const SizedBox(width: 20),
            Text(
              'PRESIDENT CANDIADATEs: ${candidatesPresident.length.toString()}',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(width: 20),
            PopupMenuButton(
                icon: const Icon(Icons.settings),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            // FirebaseAuth.instance.signOut();
                          },
                          child: const Text('Logout'),
                        ),
                      ),
                    ]),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                _createData(candidatesPresident),
                animate: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _fetchCandidatesByOffice('presido');
                    },
                    child: const Text('President')),
                ElevatedButton(
                    onPressed: () {
                      _fetchCandidatesByOffice('vp');
                    },
                    child: const Text('Vice President')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: charts.BarChart(
            //     _createData(candidatesPresident),
            //     animate: true,
            //   ),
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AdminAddCandiate();
            }));
          },
          child: const Icon(Icons.add),
        ));
  }
}
