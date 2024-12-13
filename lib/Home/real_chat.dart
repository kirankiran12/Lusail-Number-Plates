import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xffffCABA99),
      appBar: AppBar(
        backgroundColor: Color(0xffffCABA99),
        title: const Text('Chat Screen'),
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
                              ChatDetailPage(user: 'User ${index + 1}'),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Color(0xffffCABA99),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Color(0xffFFD200),
                              child: Text(
                                'U${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'This is a sample message for User ${index + 1}',
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
        title: Text('$featureName Feature'),
        content: const Text(
            'This feature is available only for premium users. Upgrade to access.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanScreen(),
                  ));
            },
            child: const Text('Upgrade'),
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
      backgroundColor: Color(0xfffCABA99),
      appBar: AppBar(
        backgroundColor: Color(0xffffCABA99),
        title: Text(user),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              _showFeatureDialog(context, 'Video Call');
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              _showFeatureDialog(context, 'Audio Call');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: const [
                Text('Chat messages will appear here...'),
              ],
            ),
          ),
          Container(
            color: Color(0xfffCABA99),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xfffCABA99),
                      filled: true,
                      hintText: 'Type your message...',
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
                  backgroundColor: Color(0xffFFD200),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      _showFeatureDialog(context, 'Send Message');
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
        title: Text('$featureName Feature'),
        content: const Text(
            'This feature is available only for premium users. Upgrade to access.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanScreen(),
                  ));
              // Handle upgrade logic here
            },
            child: const Text('Upgrade'),
          ),
        ],
      ),
    );
  }
}
