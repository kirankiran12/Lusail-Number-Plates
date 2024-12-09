import 'package:flutter/material.dart';


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
      appBar: AppBar(
        title: Text('Select Your Role'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _selectRole('Buyer');
            },
            child: Text(
              'Buyer',
              style: TextStyle(
                fontSize: 24,
                color: selectedRole == 'Buyer' ? Colors.blue : Colors.black,
                fontWeight:
                    selectedRole == 'Buyer' ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _selectRole('Seller');
            },
            child: Text(
              'Seller',
              style: TextStyle(
                fontSize: 24,
                color: selectedRole == 'Seller' ? Colors.blue : Colors.black,
                fontWeight:
                    selectedRole == 'Seller' ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            selectedRole.isEmpty
                ? 'Please select a role'
                : 'You selected: $selectedRole',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
