import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vehicle_project/Home/Notifications.dart';
import 'package:vehicle_project/Home/image_withcard.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/Home/real_chat.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/listing.dart';
import 'package:vehicle_project/translate.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final int _currentIndex = 0;
  final bool _showMore = false;
  bool _isCardVisible = false;

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
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  onChanged: _search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search'.tr,
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
        notchMargin: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home, 'Home', 0, const HomePageScreen()),
            _buildBottomNavItem(
                Icons.chat_bubble_outline_outlined, 'Chat', 1, RealChat()),
            const SizedBox(
              width: 15,
            ),
            _buildBottomNavItem(
                Icons.list, 'My List', 2, const CustomCardList()),
            _buildBottomNavItem(Icons.person, 'Account', 3, const MyAccount()),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Color(0xFF3A1D6F),
                  Color.fromARGB(255, 49, 4, 160),
                  Color(0xFFAF121F),
                  Colors.brown,
                  Color(0xFFAF121F)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFFD9D9D9),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Popular(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
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
      IconData icon, String label, int index, Widget? page) {
    final isSelected = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          var currentIndex = index;
        });
        if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
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
