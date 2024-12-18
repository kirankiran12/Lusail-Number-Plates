import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_project/Home/detail_description.dart';

class CustomCardHome extends StatefulWidget {
  const CustomCardHome({super.key});

  @override
  State<CustomCardHome> createState() => _CustomCardHomeState();
}

class _CustomCardHomeState extends State<CustomCardHome> {
  final List<Map<String, String>> avatarData2 = [
    {
      'image': 'assets/images/qattar.jpg'.tr,
      'name': 'Car Number Plate'.tr,
      'price': '50,000 Q.T'.tr,
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Car Number Plate'.tr,
      'price': '50,000 Q.T'.tr,
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Car Number Plate'.tr,
      'price': '50,000 Q.T'.tr
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatarData2.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailDescription(),
                  )),
              child: Card(
                color: const Color(0xffFFD200),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Flexible(
                  child: Container(
                    width: 140,
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
                                height: 70,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              // Dummy Text Overlay
                              Positioned(
                                left: 40,
                                bottom: 10,
                                child: Text(
                                  '000000'.tr, // Replace with your dummy text
                                  style: const TextStyle(
                                    color: Colors
                                        .black, // Text color (white for visibility on dark images)
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          avatarData2[index]['price']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          );
        },
      ),
    );
  }
}
