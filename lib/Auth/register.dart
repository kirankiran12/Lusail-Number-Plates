// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:vehicle_project/Auth/loginscreen.dart';
// import 'package:vehicle_project/Auth/role_selecter.dart';

// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});

//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   File? _image;
//   final _formKey = GlobalKey<FormState>();

//    String selectedRole = '';
//    // Initially no role is selected.
// //role select
//   void _selectRole(String role) {
//     setState(() {
//       selectedRole = role;
//     });}

//   // Controllers
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _sellerController = TextEditingController();
//     final TextEditingController _buyerController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   void dispose() {

//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//      _sellerController.dispose();
//       _buyerController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xffCABA99),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 50), // Add spacing at the top
//                     const Text(
//                       '"Complete your detail to access exclusive plate number in Qatar"',
//                       style: TextStyle(
//                         fontSize: 16,
//                         // fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 8), // Add spacing between the texts
//                     const Text(
//                       '"Enter your detail for seamless experience on Lusail Numbers"',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                         height: 0), // Add spacing between text and logo
//                     Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         SizedBox(
//                           height: 250,
//                           width: 250,
//                           child: Image.asset('assets/images/logo.jpg'),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 0),
//                     _buildTextField('Name', Icons.person, _firstNameController,
//                         (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Name is required';
//                       }
//                       return null;
//                     }),
//                     // const SizedBox(height: 10),
//                     // _buildTextField(
//                     //     'Last Name', Icons.person_outline, _lastNameController,
//                     //     (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Last Name is required';
//                     //   }
//                     //   return null;
//                     // }),
//                     const SizedBox(height: 10),
//                     _buildTextField(
//                       'Email',
//                       Icons.email,
//                       _emailController,
//                       (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email is required';
//                         } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                             .hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                     _buildTextField(
//                         'Phone Number', Icons.phone, _phoneController, (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Phone number is required';
//                       } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                         return 'Enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     }),
//                     const SizedBox(height: 10),
//                     _buildTextField('Password', Icons.lock, _passwordController,
//                         (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       } else if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     }, obscureText: true),
//                     const SizedBox(height: 10),
//                     _buildTextField('Confirm Password', Icons.lock_outline,
//                         _confirmPasswordController, (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Confirm your password';
//                       } else if (value != _passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     }, obscureText: true),

// Container(
// child: const RoleSelectorScreen()
// ),

//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Registration logic here
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content: Text('Registration Successful')),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xffFBFF1F),
//                       ),
//                       child: const Text('SignUp',
//                           style: TextStyle(color: Colors.black)),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Already have an account?",
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LoginScreen()),
//                             );
//                           },
//                           child: const Text(
//                             'SIGN IN',
//                             style: TextStyle(
//                               color: Color(0xff3B42DF),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ]),
//             ),
//           ),
//         ));
//   }

//   Widget _buildTextField(String label, IconData icon,
//       TextEditingController controller, FormFieldValidator<String>? validator,
//       {bool obscureText = false}) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: const Color(0xffB0A99C)),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Color(0xFF300F1C),
//             width: 1.5,
//           ),
//         ),
//         fillColor: Colors.white,
//         filled: true,
//       ),
//       validator: validator,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vehicle_project/Auth/loginscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedRole = ''; // Initially no role is selected.

  // Role selection function
  void _selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Add spacing at the top
                const Text(
                  '"Complete your detail to access exclusive plate number in Qatar"',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  '"Enter your detail for seamless experience on Lusail Numbers"',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/logo.jpg'),
                ),
                const SizedBox(height: 20),
                _buildTextField('Name', Icons.person, _firstNameController,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                }),
                const SizedBox(height: 10),
                _buildTextField(
                  'Email',
                  Icons.email,
                  _emailController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                _buildTextField('Phone Number', Icons.phone, _phoneController,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                }),
                const SizedBox(height: 10),
                _buildTextField('Password', Icons.lock, _passwordController,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                }, obscureText: true),
                const SizedBox(height: 10),
                _buildTextField('Confirm Password', Icons.lock_outline,
                    _confirmPasswordController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                }, obscureText: true),
                const SizedBox(height: 20),

                // Role Selection Section
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Select Your Role",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => _selectRole('Buyer'),
                            child: Text(
                              'Buyer',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedRole == 'Buyer'
                                    ? Colors.blue
                                    : Colors.black,
                                fontWeight: selectedRole == 'Buyer'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => _selectRole('Seller'),
                            child: Text(
                              'Seller',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedRole == 'Seller'
                                    ? Colors.blue
                                    : Colors.black,
                                fontWeight: selectedRole == 'Seller'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            selectedRole.isEmpty
                                ? 'Please select a role'
                                : 'You selected: $selectedRole',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        selectedRole.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Registration Successful')),
                      );
                    } else if (selectedRole.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a role')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFBFF1F),
                  ),
                  child: const Text('SignUp',
                      style: TextStyle(color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Color(0xff3B42DF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      TextEditingController controller, FormFieldValidator<String>? validator,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xffB0A99C)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF300F1C),
            width: 1.5,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: validator,
    );
  }
}
