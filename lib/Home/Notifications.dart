import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      'New product available in Normal category.',
      'Silver category items have a new discount.',
      'Gold category sale starting soon!',
      'VIP members get exclusive offers.',
    ];

    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xffCABA99),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: Text(notifications[index]),
            subtitle:
                const Text('Just now', style: TextStyle(color: Colors.grey)),
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
