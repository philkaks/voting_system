import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import '../../data/models/candidate_model.dart';

class AdminAddCandiate extends StatefulWidget {
  const AdminAddCandiate({super.key});

  @override
  State<AdminAddCandiate> createState() => _AdminAddCandiateState();
}

class _AdminAddCandiateState extends State<AdminAddCandiate> {
//
  final TextEditingController nameController = TextEditingController();
  final TextEditingController partyController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController manifestoController = TextEditingController();
  final TextEditingController currentOfficeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void addCandidate() {
    final String name = nameController.text;
    final String party = partyController.text;
    final String imageUrl = imageUrlController.text;
    final String manifesto = manifestoController.text;
    final String currentOffice = currentOfficeController.text;
    final int age = int.tryParse(ageController.text) ?? 0;
    final collectionReference = FirebaseFirestore.instance.collection('candidates');
final documentReference = collectionReference.doc(); // Create a new document reference

// Now, you can get the auto-generated document ID and assign it to your CandidateModel's id field
final String documentID = documentReference.id;

// Create a CandidateModel and set the ID
final candidate = CandidateModel(
  name: name,
  party: party,
  imageUrl: imageUrl,
  manifesto: manifesto,
  currentOffice: currentOffice,
  age: age,
  position: 'President',
  votes: 0,
  id: documentID, // Assign the auto-generated document ID here
);


    if (name.isNotEmpty && party.isNotEmpty) {
      // Add the CandidateModel to Firestore
documentReference.set(candidate.toFirestore()).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Candidate Added'),
                  ),
                ));
  
  }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Candidate'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Add Candidate', style: TextStyle(fontSize: 20)),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: partyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Party',
                  ),
                ),
                // const SizedBox(height: 26
                const SizedBox(height: 10),
                TextFormField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Image URL',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: manifestoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Manifesto',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: currentOfficeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Current Office',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                // keyboardType: TextInputType.number,
                const SizedBox(height: 26),

                ElevatedButton(
                  onPressed: addCandidate,
                  child: const Text('Add Candidate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
