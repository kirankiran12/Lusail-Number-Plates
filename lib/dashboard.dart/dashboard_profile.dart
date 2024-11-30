import 'package:flutter/material.dart';
import 'package:vehicle_project/dashboard.dart/orders_dashboard.dart';
import 'package:vehicle_project/dashboard.dart/payment_dashboard.dart';
import 'package:vehicle_project/dashboard.dart/product.dart';
import 'package:vehicle_project/dashboard.dart/user.dart';
import 'package:vehicle_project/Auth/loginscreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> cardTitles = [
    'Total Orders',
    'Total Sales',
    'Listed Items',
    'Pending \nPayments',
  ];

  final List<String> cardPrices = [
    '4500',
    '6005',
    '7878',
    '7767',
  ];

  List<String> filteredTitles = [];
  List<String> filteredPrices = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTitles = cardTitles;
    filteredPrices = cardPrices;
  }

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTitles = cardTitles;
        filteredPrices = cardPrices;
      });
      return;
    }

    setState(() {
      filteredTitles = [];
      filteredPrices = [];
      for (int i = 0; i < cardTitles.length; i++) {
        if (cardTitles[i].toLowerCase().contains(query.toLowerCase())) {
          filteredTitles.add(cardTitles[i]);
          filteredPrices.add(cardPrices[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffCABA99),
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print("Bell icon pressed");
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/08/08/37/31/360_F_808373133_lrCrFLLTXF0A2WQK7QKMCNAzKCjX7kvb.jpg'),
              radius: 18,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 230,
        backgroundColor: const Color(0xffE5D7BF),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(80)),
                      child: Image.asset(
                        'assets/images/logo.jpg', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text on top of the image
                  const Positioned(
                    top: 100,
                    left: 60,
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.black, // Change text color for visibility
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.money_off_csred_rounded),
              title: const Text('Orders'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Product'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Product(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_3),
              title: const Text('Users'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const User(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.money_off_outlined),
              title: const Text('Payments'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentDashboard(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onChanged: _filterSearchResults,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ...List.generate(filteredTitles.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFEAE13C),
                        Color(0xFFEAE13C),
                        Colors.white
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          filteredTitles[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomPaint(
                          size: const Size(100, 100),
                          painter: getRingPainter(index),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                filteredPrices[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

CustomPainter getRingPainter(int index) {
  switch (index) {
    case 0:
      return TwoColorCirclePainter(
        firstHalfColor: const Color(0xff5B46B7),
        secondHalfColor: const Color(0xffE9E9E9),
      );
    case 1:
      return TwoColorCirclePainter(
        firstHalfColor: const Color(0xffE61212),
        secondHalfColor: const Color(0xffDBBDBD),
      );
    case 2:
      return TwoColorCirclePainter(
        firstHalfColor: const Color(0xffD3B44F),
        secondHalfColor: const Color(0xffE9E9E9),
      );
    case 3:
      return TwoColorCirclePainter(
        firstHalfColor: const Color(0xff63799D),
        secondHalfColor: const Color(0xffe9e9e9),
      );
    default:
      return TwoColorCirclePainter(
        firstHalfColor: Colors.grey,
        secondHalfColor: Colors.black,
      );
  }
}

class TwoColorCirclePainter extends CustomPainter {
  final Color firstHalfColor;
  final Color secondHalfColor;

  TwoColorCirclePainter(
      {required this.firstHalfColor, required this.secondHalfColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..color = firstHalfColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Paint paint2 = Paint()
      ..color = secondHalfColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.width);

    // Draw first half (0 to π)
    canvas.drawArc(rect, -3.1, 3.14, false, paint1);

    // Draw second half (π to 2π)
    canvas.drawArc(rect, 0, 3.14, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
