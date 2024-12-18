import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vehicle_project/Home/home.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/Home/real_chat.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/detail_description.dart';
import 'package:vehicle_project/Home/listing.dart';

class Normal extends StatefulWidget {
  const Normal({super.key});

  @override
  _NormalState createState() => _NormalState();
}

class _NormalState extends State<Normal> {
  int _currentIndex = 0;
  bool _isExpanded = false;

  final List<Map<String, String>> _allAvatarData = [
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 1'.tr,
      'price': '\$10.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 2'.tr,
      'price': '\$15.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 3'.tr,
      'price': '\$20.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 4'.tr,
      'price': '\$25.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 5'.tr,
      'price': '\$30.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 6',
      'price': '\$35.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 7',
      'price': '\$40.00',
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Product 8',
      'price': '\$45.00',
    },
  ];

  late List<Map<String, String>> avatarData2;

  @override
  void initState() {
    super.initState();
    avatarData2 = _allAvatarData.sublist(0, 4); // Initially load 4 products
  }

  void _loadMoreProducts() {
    setState(() {
      if (_isExpanded) {
        avatarData2 = _allAvatarData.sublist(0, 4); // Show only 4 products
      } else {
        avatarData2 = _allAvatarData; // Show all products
      }
      _isExpanded = !_isExpanded;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        backgroundColor: const Color(0xffCABA99),
        title: Text('Normal Category'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.64,
                ),
                itemCount: avatarData2.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailDescription(),
                        ),
                      ),
                      child: Container(
                        child: Card(
                          color: const Color(0xffFFD200),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          avatarData2[index]['image']!,
                                          height: 120,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          bottom: 40,
                                          left: 30,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Text(
                                              '000000'.tr,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    avatarData2[index]['name']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    avatarData2[index]['price']!,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Some Detail'.tr,
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.favorite_border,
                                            color: Colors.black, size: 18),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'More Info'.tr,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: _loadMoreProducts,
                child: Text(_isExpanded ? 'Show Less'.tr : 'Load More'.tr),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 1.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
                Icons.home, 'Home'.tr, 0, const HomePageScreen()),
            _buildBottomNavItem(Icons.chat_bubble_outline_outlined, 'Chat'.tr,
                1, const RealChat()),
            const SizedBox(
              width: 15,
            ),
            _buildBottomNavItem(
                Icons.list, 'My List'.tr, 2, const CustomCardList()),
            _buildBottomNavItem(
                Icons.person, 'Account'.tr, 3, const MyAccount()),
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
          Text(
            'Sell'.tr,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
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
