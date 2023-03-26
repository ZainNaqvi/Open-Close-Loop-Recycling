import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            HelpItem(
              question: 'What is Waste Management app?',
              answer:
                  'Waste Management app is a mobile application designed to help users manage their waste effectively and efficiently. The app provides features such as requesting waste pickup, tracking waste pickup status, and finding nearby recycling centers.',
            ),
            HelpItem(
              question: 'How can I request a waste pickup?',
              answer:
                  'To request a waste pickup, open the app and go to the Request Pickup screen. Fill in the details of your pickup request and submit it. You will receive a notification once your pickup is scheduled.',
            ),
            HelpItem(
              question: 'How can I track the status of my pickup?',
              answer:
                  'To track the status of your pickup, go to the My Requests screen in the app. You will see the status of your pickup request and any updates on its progress.',
            ),
            HelpItem(
              question: 'How can I find recycling centers near me?',
              answer:
                  'To find recycling centers near you, open the app and go to the Find Recycling Centers screen. The app will show you a map of nearby recycling centers and their details.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            HelpItem(
              question: 'Email',
              answer: 'support@wastemanagementapp.com',
            ),
            HelpItem(
              question: 'Phone',
              answer: '+92 (333) 333-333',
            ),
          ],
        ),
      ),
    );
  }
}

class HelpItem extends StatelessWidget {
  final String question;
  final String answer;

  HelpItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
