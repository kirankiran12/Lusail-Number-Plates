import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
  // FAQ data
  final List<Map<String, String>> faqs = [
    {
      'question': 'Do I need an account to buy or sell number plates?'.tr,
      'answer': 'Yes, an account is required to buy or sell number plates.'.tr,
    },
    {
      'question': 'How can I list my number plate for sale?',
      'answer':
          'To list your number plate, log in to your account, click on "Post," provide the details, and your plate will be ready for sale.',
    },
    {
      'question': 'Will the app support multiple languages?',
      'answer': 'Yes, the app supports both English and Arabic.',
    },
    {
      'question': 'Is there a fee for listing my number plate?',
      'answer':
          'No, listing is free. However, transaction fees may apply on sales.',
    },
    {
      'question': 'Can I edit my number plate listing after posting it?',
      'answer':
          'Yes, you can edit your listing details anytime from "My Listings."',
    },
    {
      'question': 'Is my personal information shared with other users?',
      'answer':
          'No, your personal information remains private. All communication is handled within the app.',
    },
    {
      'question': 'How do I delete my account if needed?',
      'answer':
          'You can delete your account by going to "View Profile" > "Delete" and selecting the delete option.',
    },
  ];

  FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCABA99),
      appBar: AppBar(
        title: Text('FAQ'.tr), // Translated: "FAQ"
        backgroundColor: const Color(0xFF5053D5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Frequently Asked Questions'
                      .tr, // Translated: "Frequently Asked Questions"
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            final faq = faqs[index - 1];
            return Card(
              color: const Color(0xFFCABA99),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: Text(
                  faq['question']!.tr, // Translated question
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      faq['answer']!.tr, // Translated answer
                      style:
                          const TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
