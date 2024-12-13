import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  void _onSubscribe(String plan) {
    // Handle subscription purchase logic here
    // For example: call your payment API
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Subscription'),
        content: Text('You selected the $plan plan.'),
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFD200)),
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffCABA99),
      appBar: AppBar(
        backgroundColor: Color(0xffffCABA99),
        title: const Text('Subscription Plans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPlanCard('Monthly Plan', '\$10/month',
                () => _onSubscribe('Monthly Plan')),
            const SizedBox(height: 16),
            _buildPlanCard('6 Months Plan', '\$50/6 months',
                () => _onSubscribe('6 Months Plan')),
            const SizedBox(height: 16),
            _buildPlanCard(
                'Yearly Plan', '\$90/year', () => _onSubscribe('Yearly Plan')),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(String title, String price, VoidCallback onSubscribe) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFD200)),
                onPressed: onSubscribe,
                child: const Text('Subscribe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
