import 'package:flutter/material.dart';

import 'package:vehicle_project/dashboard.dart/profile.dart';
import 'package:vehicle_project/profileScreen/favorites.dart';
import 'package:vehicle_project/Auth/loginscreen.dart';
import 'package:vehicle_project/profileScreen/orderscreen.dart';
import 'package:vehicle_project/profileScreen/payments.dart';
import 'package:vehicle_project/profileScreen/trash.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffCABA99),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: const NetworkImage(
                          'https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg',
                        ),
                        onBackgroundImageError: (_, __) =>
                            print("Image failed to load"),
                        child: const Icon(Icons.person),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Haroon Rasheed',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 1),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserProfileScreen(),
                                  ));
                            },
                            child: const Text(
                              'View & Edit Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                        height: 0,
                        indent: 170,
                        endIndent: 170,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      // Replaced onLongPress with onTap
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Favorites(),
                            ),
                          );
                        },
                        child: _buildListTile(
                          leadingIcon: Icons.favorite_outline_outlined,
                          title: "Favorites & Saved \n Searches",
                          subtitle: "Favorites & Saved Searches",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      // Replaced onLongPress with onTap
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Order(),
                            ),
                          );
                        },
                        child: _buildListTile(
                          leadingIcon: Icons.money_off,
                          title: "Orders",
                          subtitle: "Orders, Billing, and invoices",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      // Trash
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrashScreen(),
                            ),
                          );
                        },
                        child: _buildListTile(
                          leadingIcon: Icons.emoji_transportation,
                          title: "My Trash",
                          subtitle:
                              "Track your selling or buying \n delivery orders",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      // Payments
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Payment(),
                            ),
                          );
                        },
                        child: _buildListTile(
                          leadingIcon: Icons.money_off_outlined,
                          title: "Payments",
                          subtitle: "Manage your payments",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      // Logout
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Logout Confirmation',
                                  style: TextStyle(fontSize: 20),
                                ),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.logout_outlined),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      )
                    ]))));
  }

  Widget _buildListTile({
    required IconData leadingIcon,
    required String title,
    required String subtitle,
    required IconData trailingIcon,
  }) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: Colors.black,
        size: 20,
      ),
      // Removed onTap here, it's handled by InkWell
    );
  }
}
