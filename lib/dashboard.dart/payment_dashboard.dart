import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class PaymentDashboard extends StatefulWidget {
  const PaymentDashboard({super.key});

  @override
  _PaymentDashboardScreenState createState() => _PaymentDashboardScreenState();
}

class _PaymentDashboardScreenState extends State<PaymentDashboard> {
  final List<String> cardTitles = [
    'Send'.tr,
    'Receive'.tr,
    'Pending'.tr,
    'Remaining Balance'.tr,
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
        title: Text(
          'Payments'.tr,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  hintText: 'Search...'.tr,
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
                                filteredPrices[index].tr,
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
