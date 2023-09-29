import 'package:flutter/material.dart';

class VotingGuidlines extends StatelessWidget {
  const VotingGuidlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voting Guidelines'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How to Vote:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              const Text(
                '1. Check your eligibility to vote. Make sure you are registered to vote and meet the age and citizenship requirements.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '2. Find your polling place. You can find your polling place by checking your voter registration card or by contacting your local election office.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '3. Bring a valid ID. Make sure to bring a valid ID with you to the polling place.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '4. Check the voting hours. Make sure to check the voting hours for your polling place and plan accordingly.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '5. Get in line. When you arrive at the polling place, get in line and wait for your turn to vote.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '6. Cast your vote. Follow the instructions on the voting machine or ballot to cast your vote.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '7. Verify your vote. Make sure to verify your vote before submitting it.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '8. Submit your vote. Submit your vote and wait for the confirmation.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '9. Get your sticker. After submitting your vote, you will receive an "I Voted" sticker.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '10. Encourage others to vote. Encourage your friends and family to vote and make their voices heard.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '11. Follow up. Follow up with your local election office to make sure your vote was counted.',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '12. Celebrate. Celebrate your vote and the fact that you made your voice heard.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
