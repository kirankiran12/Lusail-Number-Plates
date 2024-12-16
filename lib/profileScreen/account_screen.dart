import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_project/dashboard.dart/profile.dart';
import 'package:vehicle_project/profileScreen/favorites.dart';
import 'package:vehicle_project/Auth/loginscreen.dart';
import 'package:vehicle_project/profileScreen/orderscreen.dart';
import 'package:vehicle_project/profileScreen/payments.dart';
import 'package:vehicle_project/profileScreen/trash.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String _selectedLanguage = 'English'; // Default selected language

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  // Load the language preference from shared preferences
  _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedLanguage = prefs.getString('language') ??
        'English'; // Default to English if no language is found
    setState(() {
      _selectedLanguage = savedLanguage;
    });

    // Dynamically update the locale
    if (savedLanguage == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (savedLanguage == 'Arabic (UAE)') {
      Get.updateLocale(const Locale('ar', 'AE'));
    }
  }

  // Save the language preference in shared preferences
  _saveLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);

    // Update the app's locale
    if (language == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (language == 'Arabic (UAE)') {
      Get.updateLocale(const Locale('ar', 'AE'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _selectedLanguage == 'Arabic (UAE)'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xffCABA99),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const NetworkImage(
                    'https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg',
                  ),
                  onBackgroundImageError: (_, __) => setState(() {
                    // Optionally set a fallback image URL or show a placeholder
                    print("Image failed to load");
                  }),
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Haroon Rasheed'.tr,
                      style: const TextStyle(
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
                            builder: (context) => const UserProfileScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'View & Edit Profile'.tr,
                        style: const TextStyle(
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
                const SizedBox(height: 8),
                // Language Dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedLanguage = newValue;
                        });
                        _saveLanguage(newValue);
                      }
                    },
                    items: <String>[
                      'English',
                      'Arabic (UAE)',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                // Favorites
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
                    title: "Favorites & Saved \n Searches".tr,
                    subtitle: "Favorites & Saved Searches".tr,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                // Orders
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
                    title: "Orders".tr,
                    subtitle: "Orders, Billing, and invoices".tr,
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
                    title: "My Trash".tr,
                    subtitle:
                        "Track your selling or buying \n delivery orders".tr,
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
                    title: "Payments".tr,
                    subtitle: "Manage your payments".tr,
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
                          title: Text(
                            'Logout Confirmation'.tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          content: Text('Are you sure you want to logout?'.tr),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'.tr),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text('Yes'.tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text(
                      'Logout'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
    );
  }
}
