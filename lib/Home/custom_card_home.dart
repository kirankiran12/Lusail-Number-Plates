import 'package:flutter/material.dart';
import 'package:vehicle_project/Home/detail_description.dart';

class CustomCardHome extends StatefulWidget {
  const CustomCardHome({super.key});

  @override
  State<CustomCardHome> createState() => _CustomCardHomeState();
}

class _CustomCardHomeState extends State<CustomCardHome> {
  final List<Map<String, String>> avatarData2 = const [
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Car Number Plate',
      'price': '50,000 Q.T'
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Car Number Plate',
      'price': '50,000 Q.T'
    },
    {
      'image': 'assets/images/qattar.jpg',
      'name': 'Car Number Plate',
      'price': '50,000 Q.T'
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
                              const Positioned(
                                left: 40,
                                bottom: 10,
                                child: Text(
                                  '000000', // Replace with your dummy text
                                  style: TextStyle(
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
                            const Text(
                              'Some Detail',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border,
                                  color: Colors.black, size: 18),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const Text(
                          'More Info',
                          style: TextStyle(fontSize: 10, color: Colors.black),
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
