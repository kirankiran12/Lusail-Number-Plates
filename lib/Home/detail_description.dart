import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/Home/real_chat.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/chat_screen.dart';
import 'package:vehicle_project/Home/home.dart';
import 'package:vehicle_project/Home/listing.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({super.key});

  @override
  _DetailDescriptionState createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        backgroundColor: const Color(0xffCABA99),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.jpg',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/qattar.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 120, // Position from the bottom
                  left: 126, // Position from the left
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      '000000'.tr,
                      style: TextStyle(
                        color: Colors.black, // Text color
                        fontSize: 16, // Font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '50,000 Q.T'.tr, // Translated: "50,000 Q.T"
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sports car | Number plate'.tr.tr,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  'Bahawalpur, Punjab, Pakistan'.tr,
                  // Translated: "Bahawalpur, Punjab, Pakistan"
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Text(
              'Details'.tr, // Translated: "Details"
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailItem('Plate Number:'.tr, '195700'),
            const SizedBox(height: 10),
            _buildDetailItem('Owner Name:'.tr, 'Haroon Rasheed'),
            const SizedBox(height: 10),
            _buildDetailItem('Price:'.tr, '50,000 Q.T'),
            const SizedBox(height: 10),
            Text(
              'Description'.tr, // Translated: "Description"
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "I am selling this my Qatar number plate because I don't need it anymore. Please help me and buy this number plate."
                  .tr, // Translated description
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RealChat(),
                        ));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Text(
                    'Contact Seller'.tr, // Translated: "Contact Seller"
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff554E40),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                  child: Text(
                    'Book Now'.tr, // Translated: "Book Now"
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Listed by Private User:'
                  .tr, // Translated: "Listed by Private User:"
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/128/13716/13716552.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Haroon Rasheed',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Joined in January 2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(children: [
                      const Text(
                        'View Profile   ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp)
                    ])
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
                Icons.home, 'Home'.tr, 0, const HomePageScreen()),
            _buildBottomNavItem(
                Icons.chat_bubble_outline_outlined, 'Chat'.tr, 1, RealChat()),
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
          const Text(
            'Sell',
            style: TextStyle(color: Colors.black, fontSize: 18),
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

Widget _buildDetailItem(String title, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr, // Translated: title
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
