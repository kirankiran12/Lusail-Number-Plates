import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:vehicle_project/Auth/new_password_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCABA99),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/logo.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Center(
                  child: Card(
                    color: const Color(0xffCABA99),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'OTP Verification'
                                .tr, // Translated: "OTP Verification"
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Please enter the 4-digit OTP sent to your email.'
                                .tr, // Translated: "Please enter the 4-digit OTP sent to your email."
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          PinCodeTextField(
                            controller: otpController,
                            highlight: true,
                            highlightColor: Colors.blue,
                            defaultBorderColor: Colors.grey,
                            hasTextBorderColor: Colors.black,
                            maxLength: 4,
                            hasError: false,
                            pinBoxHeight: 40, // Adjusted height
                            pinBoxWidth: 30, // Adjusted width
                            wrapAlignment:
                                WrapAlignment.center, // Center align the boxes
                            pinTextStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            onTextChanged: (value) {
                              if (kDebugMode) {
                                print("Current OTP: $value");
                              }
                            },
                            onDone: (otp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'OTP Verified: $otp'
                                        .tr, // Translated: "OTP Verified"
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'OTP Entered: ${otpController.text}'
                                        .tr, // Translated: "OTP Entered"
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              backgroundColor: const Color(0xffFBFF1F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Verify OTP".tr, // Translated: "Verify OTP"
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Newpassword(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              backgroundColor: const Color(0xFFFBFF1F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Create new password'
                                  .tr, // Translated: "Create new password"
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
