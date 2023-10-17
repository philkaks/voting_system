import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voting_system/features/user/presentation/pages/admin_graphs.dart';
import 'package:voting_system/features/user/presentation/pages/sign_up.dart';

import '../widgets/input_field.dart';
import 'candidates_view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  bool isAdmin = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _adminIdController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ignore: use_build_context_synchronously
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.25,
          child: Form(
            key: _formKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    InputFieldWidget(
                      emailController: _emailController,
                      labelText: 'Email',
                      errorText: 'Please enter your email',
                    ),
                    const SizedBox(height: 16.0),
                    InputFieldWidget(
                      emailController: _passwordController,
                      labelText: 'Password',
                      errorText: 'Please enter your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    isAdmin
                        ? InputFieldWidget(
                            emailController: _adminIdController,
                            labelText: 'Admin ID',
                            errorText: 'Please enter your password',
                            obscureText: true,
                          )
                        : const SizedBox(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ElevatedButton(
                      onPressed: isAdmin
                          ? () {
                              if (_formKey.currentState!.validate() &&
                                  _adminIdController.text ==
                                      '1234567890') {
                                _signInWithEmailAndPassword().then((value) => 
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AdminPage()),
                                )
                                
                                );
                              }
                            }
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _signInWithEmailAndPassword().then((value) => 
                                
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CandidatesView()),
                                )
                                
                                );
                              }
                            },
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Sign In'),
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: Colors.blue),
                              )
                            ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isAdmin = !isAdmin;
                        });
                      },
                      child: RichText(
                        text: const TextSpan(
                            text: 'if you are an admin, ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'click here',
                                style: TextStyle(color: Colors.blue),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
