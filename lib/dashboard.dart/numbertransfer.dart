import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final List<String> cardTitles = [
    'New Orders',
    'In Progress',
    'Number Transferred',
    'Total Transferred',
  ];

  final List<String> cardPrices = [
    '4500',
    '6005',
    '7878',
    '7767',
  ];

  final List<IconData> cardIcons = [
    Icons.add_shopping_cart,
    Icons.production_quantity_limits,
    Icons.local_shipping,
    Icons.check_circle,
  ];

  List<String> filteredTitles = [];
  List<String> filteredPrices = [];
  List<IconData> filteredIcons = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially, show all items
    filteredTitles = List.from(cardTitles);
    filteredPrices = List.from(cardPrices);
    filteredIcons = List.from(cardIcons);
  }

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTitles = List.from(cardTitles);
        filteredPrices = List.from(cardPrices);
        filteredIcons = List.from(cardIcons);
      });
      return;
    }

    setState(() {
      filteredTitles = [];
      filteredPrices = [];
      filteredIcons = [];
      for (int i = 0; i < cardTitles.length; i++) {
        if (cardTitles[i].toLowerCase().contains(query.toLowerCase())) {
          filteredTitles.add(cardTitles[i]);
          filteredPrices.add(cardPrices[i]);
          filteredIcons.add(cardIcons[i]);
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
          'Number Transfer',
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
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFfADFF28), // Top color
                          Color(0xFfADFF28), // Middle color
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
                          filteredIcons[index],
                          size: 40,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          filteredTitles[index],
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
                              filteredPrices[index],
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
          ],
        ),
      ),
    );
  }
}
