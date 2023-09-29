import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_system/features/user/presentation/pages/sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  String _name = '';
  String _email = '';
  String _password = '';

  void _fetchUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('VotingUsers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final data = snapshot.data();
    setState(() {
      _name = data!['username'] ?? 'not found';
      _email = data['email'] ?? 'not found';
      _password = data['password'] ?? 'not found';
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: _name,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  _email,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  _password,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    _saveUserData();
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                ElevatedButton(
                  child: const Text('Sign Out',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveUserData() async {
    await FirebaseFirestore.instance
        .collection('VotingUsers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'name': _name,
      'email': _email,
      'password': _password,
    });
  }
}
