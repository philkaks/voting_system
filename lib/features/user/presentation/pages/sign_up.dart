import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import 'package:voting_system/features/user/presentation/pages/sign_in.dart';
import 'package:voting_system/features/user/presentation/widgets/input_field.dart';
import '../../data/repositories_implementation/repo_implemtation.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  final UserRepositoryImplementation userRepository =
      UserRepositoryImplementation();
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sign Up'),
                  InputFieldWidget(emailController: _nameController,
                   labelText: 'Name',
                    errorText: ''),
                  InputFieldWidget(emailController: _emailController, 
                  labelText: 'Email',
                   errorText: 'Please enter your email',),
                  const SizedBox(height: 16.0),
                  InputFieldWidget(emailController: _passwordController,
                    labelText: 'Password',
                      errorText: 'Please enter your password',),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      userRepository.registerUserWithEmailAndPassword(
                          _emailController, _passwordController).then((value) => 
                          _firestore.collection('VotingUsers').add({
                            'username': _nameController.text,
                            'email': _emailController.text,
                            'password': _passwordController.text,
                          })
                          );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                      );
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
