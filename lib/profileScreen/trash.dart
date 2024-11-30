import 'package:flutter/material.dart';
import 'package:vehicle_project/Home/popular.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/Home/home.dart';
import 'package:vehicle_project/Home/listing.dart';

import '../Home/chat_screen.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<TrashScreen> {
  int _currentIndex = 0;
  String status = 'Select Status';
  Color statusColor = Colors.black;

  final List<String> cardTitles = [
    'New\nOrders',
    'Inn\nProcess',
    'Delivery',
    'Total\nDelivered',
  ];

  final List<String> cardPrices = [
    '2',
    '1',
    '0',
    '5',
  ];
  final List<IconData> cardIcons = [
    Icons.add_shopping_cart,
    Icons.production_quantity_limits,
    Icons.local_shipping,
    Icons.check_circle,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        backgroundColor: const Color(0xffCABA99),
        title: const Text('MeTrash'),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(cardTitles.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Container(
                    // width: 200,
                    // height: 200,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFC6D68F), // Top color
                            Color(0xFFDADEB6), // Middle color
                            Colors.white, // Bottom color
                          ],
                          stops: [
                            0.0,
                            0.5, // Position of middle color
                            1.0, // Position of bottom color
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20), // Circular border radius
                        )),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            cardIcons[index],
                            size: 40,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cardTitles[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                cardPrices[index],
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const Divider(
                color: Colors.black,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Orders',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  elevation: 0,
                  child: Container(
                    width: 430,
                    height: 130,
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/qattar.jpg',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Private Plate 195700',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 28),
                                Text(
                                  'Monday, 11 November \n2024(GMT-5)',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Positioned(
                          top: 20,
                          left: 90,
                          child: Text(
                            'Sold',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 35,
                          left: 90,
                          child: Text(
                            '50,000 Q.T',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 205,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xffCABA99),
                                    title: const Text('Select Status'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: const Text('Paid'),
                                          onTap: () {
                                            setState(() {
                                              status = 'Paid';
                                              statusColor = Colors.green;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Unpaid'),
                                          onTap: () {
                                            setState(() {
                                              status = 'Unpaid';
                                              statusColor = Colors.red;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Pending'),
                                          onTap: () {
                                            setState(() {
                                              status = 'Pending';
                                              statusColor = Colors.orange;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('Success'),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 2,
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home, 'Home', 0, const HomePageScreen()),
            _buildBottomNavItem(
                Icons.chat_bubble_outline_outlined, 'Chat', 1, FaqScreen()),
            InkWell(
                child: _buildBottomNavItem(
                    Icons.list, 'My List', 2, const CustomCardList())),
            _buildBottomNavItem(
              Icons.person,
              'Account',
              3,
              const MyAccount(),
            ),
          ],
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
                ),
              )),
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
          _currentIndex = index;
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
