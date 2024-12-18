import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectorScreen extends StatefulWidget {
  const RoleSelectorScreen({super.key});

  @override
  _RoleSelectorScreenState createState() => _RoleSelectorScreenState();
}

class _RoleSelectorScreenState extends State<RoleSelectorScreen> {
  String selectedRole = ''; // Initially no role is selected.

  void _selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _selectRole('Buyer');
            },
            child: Text(
              'Buyer'.tr, // Translated: "Buyer"
              style: TextStyle(
                fontSize: 24,
                color: selectedRole == 'Buyer' ? Colors.blue : Colors.black,
                fontWeight: selectedRole == 'Buyer'
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _selectRole('Seller');
            },
            child: Text(
              'Seller'.tr, // Translated: "Seller"
              style: TextStyle(
                fontSize: 24,
                color: selectedRole == 'Seller'.tr ? Colors.blue : Colors.black,
                fontWeight: selectedRole == 'Seller'.tr
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            selectedRole.isEmpty
                ? 'Please select a role'
                    .tr // Translated: "Please select a role"
                : 'You selected: ${selectedRole == 'Seller' ? 'Seller'.tr : 'Buyer'.tr}', // Translated dynamic message
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
