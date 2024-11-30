import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<String> cardTitles = [
    'Accepted',
    'Rejected',
    'Pending',
  ];

  final List<String> cardPrices = [
    '450/1222',
    '600/4545',
    '787/8990',
  ];

  List<Map<String, String>> items = [
    {
      "UserID": "0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "Malik",
      "Email": "malik@gmail.com",
    },
  ];

  List<String> filteredTitles = [];
  List<String> filteredPrices = [];
  List<Map<String, String>> filteredItems = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTitles = cardTitles;
    filteredPrices = cardPrices;
    filteredItems = items; // Initialize filteredItems
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
          'Orders',
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
            }),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // The text fields in the header row
                  Expanded(
                    child: Text(
                      'UserId',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Picture',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Email',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '   Edit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '  Delete',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

// List of Users
            SizedBox(
              height: 400, // Fixed height for the list
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // User ID
                          Expanded(
                            child: Text(
                              item['UserID']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Picture
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item['image']!,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // User Name
                          Expanded(
                            child: Text(
                              item['UserName']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // User Email
                          Expanded(
                            child: Text(
                              item['Email']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Edit Button
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () {
                                // Edit action
                              },
                            ),
                          ),
                          // Delete Button
                          Expanded(
                            child: IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  filteredItems
                                      .removeAt(index); // Update filtered list
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                ),
                child: const Text(
                  'Load More',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomPainter getRingPainter(int index) {
    return RingPainter(index);
  }
}

class RingPainter extends CustomPainter {
  final int index;
  RingPainter(this.index);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    double progress = (index + 1) / 3;
    double sweepAngle = 2 * 3.14159265359 * progress;
    canvas.drawArc(
      Offset.zero & size,
      -3.14159265359 / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
