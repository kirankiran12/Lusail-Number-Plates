import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      'new_product'.tr,
      'silver_discount'.tr,
      'gold_sale'.tr,
      'vip_offers'.tr,
    ];

    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        title: Text('notifications_title'.tr),
        backgroundColor: const Color(0xffCABA99),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: Text(notifications[index], textDirection: TextDirection.rtl),
            subtitle: Text(
              'just_now'.tr,
              style: TextStyle(color: Colors.grey),
              textDirection: TextDirection.rtl,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            onTap: () {
              print('Tapped on notification: ${notifications[index]}');
            },
          );
        },
      ),
    );
  }
}
