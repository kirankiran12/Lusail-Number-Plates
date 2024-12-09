import 'package:flutter/material.dart';
import 'package:vehicle_project/Home/Notifications.dart';
import 'package:vehicle_project/Home/image_withcard.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/listing.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;
  final bool _showMore = false;

  // Sample data for search functionality
  final List<String> searchData = [
    'Normal',
    'Vip',
    'Gold',
    'Silver',
  ];
  List<String> searchResults = [];

  void _search(String query) {
    setState(() {
      searchResults = query.isEmpty
          ? []
          : searchData
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xffCABA99),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo.jpg',
                      height: 70,
                      width: 80,
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  onChanged: _search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (searchResults.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(searchResults[index]),
                        ),
                      );
                    },
                  ),
                ),
              const ImageWithTextOverlay(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.home, 'Home', 0, () {}),
              Spacer(),
              _buildBottomNavItem(Icons.question_answer, 'FAQ', 1, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqScreen(),
                  ),
                );
              }),
              Spacer(),
              _buildBottomNavItem(Icons.list, 'My List', 2, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomCardList(),
                  ),
                );
              }),
              Spacer(),
              _buildBottomNavItem(Icons.person, 'Account', 3, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAccount(),
                    ));
              }),
              Spacer()
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Color(0xff3A1D6F),
                    Color.fromARGB(225, 49, 4, 160),
                    Color(0xffAF121F),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Popular(),
                            ));
                      },
                    ),
                  ))),
          const SizedBox(height: 4),
          const Text(
            'Sell',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _buildBottomNavItem(
      IconData icon, String label, int index, Function onTap) {
    final isSelected = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isSelected ? const Color(0xff300F1C) : Colors.black),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xff300F1C) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
