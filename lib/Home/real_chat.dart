import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/plans.dart';

class RealChat extends StatefulWidget {
  const RealChat({super.key});

  @override
  State<RealChat> createState() => _RealChatState();
}

class _RealChatState extends State<RealChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcaba99),
      appBar: AppBar(
        backgroundColor: const Color(0xffffcaba99),
        title: Text('Chat Screen'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FaqScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatDetailPage(user: 'User ${index + 1}'.tr),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffffcaba99),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: const Color(0xffFFD200),
                              child: Text(
                                'U${index + 1}'.tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'This is a sample message for User ${index + 1}'
                                        .tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //
            ],
          );
        },
      ),
    );
  }

  void _showFeatureDialog(String featureName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$featureName Feature'.tr),
        content: Text(
            'This feature is available only for premium users. Upgrade to access.'
                .tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlanScreen(),
                  ));
            },
            child: Text('Upgrade'.tr),
          ),
        ],
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String user;

  const ChatDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcaba99),
      appBar: AppBar(
        backgroundColor: const Color(0xffffcaba99),
        title: Text(user),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              _showFeatureDialog(context, 'Video Call'.tr);
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              _showFeatureDialog(context, 'Audio Call'.tr);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                Text('Chat messages will appear here...'.tr),
              ],
            ),
          ),
          Container(
            color: const Color(0xfffcaba99),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xfffcaba99),
                      filled: true,
                      hintText: 'Type your message...'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                CircleAvatar(
                  backgroundColor: const Color(0xffFFD200),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      _showFeatureDialog(context, 'Send Message'.tr);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showFeatureDialog(BuildContext context, String featureName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$featureName Feature'.tr),
        content: Text(
            'This feature is available only for premium users. Upgrade to access.'
                .tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlanScreen(),
                  ));
              // Handle upgrade logic here
            },
            child: Text('Upgrade'.tr),
          ),
        ],
      ),
    );
  }
}
