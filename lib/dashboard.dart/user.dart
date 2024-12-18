import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List<Map<String, String>> items = [
    {
      "UserID": "  0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "   Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "   0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "   Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "   0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "   Malik",
      "Email": "malik@gmail.com",
    },
    {
      "UserID": "   0118",
      "image": "assets/images/qattar2.jpg",
      "UserName": "   Malik",
      "Email": "malik@gmail.com",
    },
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    searchController.addListener(() {
      filterItems();
    });
  }

  void filterItems() {
    setState(() {
      filteredItems = items
          .where((item) =>
              item['UserName']!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              item['UserID']!.contains(searchController.text))
          .toList();
    });
  }

  void updateFilteredItems() {
    setState(() {
      filteredItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCABA99),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Users'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/red_car.jpg'),
                ),
              ],
            ),
          ),
          const Divider(height: 10, color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Search'.tr,
                hintText: 'Search by Owner Name or ID'.tr,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'UserId'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Picture'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Name'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Email'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Text(
                    '     Edit'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Text(
                    '     Delete'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                        Expanded(
                            child: Text(
                          item['UserID']!.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        )),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              item['image']!,
                              height: 50,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          item['UserName']!.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        )),
                        Expanded(
                            child: Text(
                          item['Email']!.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        )),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.black),
                            onPressed: () {
                              // Edit action
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                                updateFilteredItems();
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              child: Text(
                "Learn more".tr,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
