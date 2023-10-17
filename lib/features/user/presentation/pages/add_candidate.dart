import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';

import 'candidates_view.dart';

class AddCandidatePage extends StatefulWidget {
  const AddCandidatePage({super.key});

  @override
  AddCandidatePageState createState() => AddCandidatePageState();
}

class AddCandidatePageState extends State<AddCandidatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _positionController = TextEditingController();
  final _partyController = TextEditingController();
  final _manifestoController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _currentOfficeController = TextEditingController();
  // final _idController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Candidates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(
                  labelText: 'Position',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a position';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _partyController,
                decoration: const InputDecoration(
                  labelText: 'Party',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a party';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _manifestoController,
                decoration: const InputDecoration(
                  labelText: 'Manifesto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a manifesto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _currentOfficeController,
                decoration: const InputDecoration(
                  labelText: 'Current Office',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a current office';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final age = int.parse(_ageController.text);
                    final position = _positionController.text;
                    final party = _partyController.text;
                    final manifesto = _manifestoController.text;
                    final imageUrl = _imageUrlController.text;
                    final currentOffice = _currentOfficeController.text;
                    // final id = _idController.text;

                    await FirebaseFirestore.instance
                        .collection('candidates')
                        .doc()
                        .set(CandidateModel(
                          name: name,
                          age: age,
                          position: position,
                          party: party,
                          manifesto: manifesto,
                          imageUrl: imageUrl,
                          currentOffice: currentOffice,
                          votes: 0,
                          id: FirebaseFirestore.instance
                              .collection('candidates')
                              .doc()
                              .id,
                        ).toFirestore())
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Candidate Added'),
                        ),
                      );
                    });
                  }
                  setState(() {
                    isLoading = false;
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CandidatesView();
                  }));
                },
                child: isLoading
                    ? const SizedBox(
                        height: 16, child: CircularProgressIndicator())
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
