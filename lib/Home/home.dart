import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vehicle_project/Home/Notifications.dart';
import 'package:vehicle_project/Home/image_withcard.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/Home/real_chat.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/listing.dart';
import 'package:vehicle_project/profileScreen/translate.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final int _currentIndex = 0;
  final bool _showMore = false;
  final bool _isCardVisible = false;

  // Sample data for search functionality
  final List<String> searchData = [
    'Normal'.tr,
    'Vip'.tr,
    'Gold'.tr,
    'Silver'.tr,
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
    // Use Directionality to handle Arabic text direction
    return Directionality(
      textDirection: Get.locale?.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: MaterialApp(
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
                          icon: const Icon(Icons.notifications,
                              color: Colors.black),
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
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                searchResults[index],
                                overflow: TextOverflow.ellipsis,
                              ),
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
            color: Colors.white,
            child: SizedBox(
              height: 60, // Adjusted height for proper alignment
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildBottomNavItem(
                      Icons.home,
                      'Home'.tr,
                      0,
                      const HomePageScreen(),
                    ),
                  ),
                  Expanded(
                    child: _buildBottomNavItem(
                      Icons.chat_bubble_outline_outlined,
                      'Chat'.tr,
                      1,
                      const RealChat(),
                    ),
                  ),
                  const SizedBox(width: 50), // Space for FAB
                  Expanded(
                    child: _buildBottomNavItem(
                      Icons.list,
                      'My List'.tr,
                      2,
                      const CustomCardList(),
                    ),
                  ),
                  Expanded(
                    child: _buildBottomNavItem(
                      Icons.person,
                      'Account'.tr,
                      3,
                      const MyAccount(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Popular(),
                    ),
                  );
                },
                backgroundColor: const Color(0xFFD9D9D9),
                child: const Icon(Icons.add, color: Colors.black),
              ),
              const SizedBox(
                  height: 4), // Adjusted spacing for visual alignment
              Text(
                'Sell'.tr,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      IconData icon, String label, int index, Widget? page) {
    final isSelected = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xff300F1C) : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xff300F1C) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
