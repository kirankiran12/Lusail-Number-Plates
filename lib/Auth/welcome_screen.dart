import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_project/Home/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    // Initializing the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 8), // Shortened duration for faster animation
    );

    // Fade Animation for Text and Logo
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Scale Animation for the Logo (larger scale for faster zoom)
    _scaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Slide Animation for the "Welcome" Text (slide from the top)
    _slideAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Rotation Animation for the Logo (spinning effect)
    _rotateAnimation = Tween<double>(begin: 0.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Trigger the animation
    _animationController.forward();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCABA99),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Fade-in and Slide-in Text for "Welcome"
              SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, -1), end: const Offset(0, 0))
                    .animate(_animationController),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Welcome'.tr,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Animated Scale and Rotation Transition for the Logo
              RotationTransition(
                turns: _rotateAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/car.jpg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Animated Fade-in Text for the message with faster speed
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  '"Welcome to Lusail Numbers - Your gateway to exclusive car plates in Qatar!"'
                      .tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
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
