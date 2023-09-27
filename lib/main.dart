import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/features/user/presentation/pages/candidates_view.dart';

import 'features/user/domain/usecases/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Voting System',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:
            // const SignInPage()
            //  SignUpPage()
            //  AddCandidatePage()
            CandidatesView());
  }
}
