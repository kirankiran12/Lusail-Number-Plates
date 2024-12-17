import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

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
        title: Text('subscription_title'.tr),
        content: Text('subscription_message'.trParams({'plan': plan})),
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFFD200),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text('ok'.tr),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffCABA99),
      appBar: AppBar(
        backgroundColor: const Color(0xffffCABA99),
        title: Text('subscription_plans'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPlanCard(
              'monthly_plan_title'.tr,
              'monthly_plan_price'.tr,
              () => _onSubscribe('monthly_plan_title'.tr),
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              'six_months_plan_title'.tr,
              'six_months_plan_price'.tr,
              () => _onSubscribe('six_months_plan_title'.tr),
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              'yearly_plan_title'.tr,
              'yearly_plan_price'.tr,
              () => _onSubscribe('yearly_plan_title'.tr),
            ),
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
                  backgroundColor: const Color(0xffFFD200),
                ),
                onPressed: onSubscribe,
                child: Text('subscribe'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
