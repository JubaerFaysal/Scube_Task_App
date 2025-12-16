import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_task_app/screens/dashboard_screen.dart';

import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF0096FC),
      body: Stack(
        children: [
          /// bottom section
          Positioned(
            left: 0,
            right: 0,
            top: 336,
            child: Container(
              width: screenWidth,
              height: screenHeight - 336,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),

          /// Logo
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 96,
                height: 98,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ///title
          Positioned(
            left: 0,
            right: 0,
            top: 198,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "SCUBE\n",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: "Control & Monitoring System",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 28 / 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Login text
          Positioned(
            left: 0,
            right: 0,
            top: 368,
            child: Center(
              child: Text(
                'Login',
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 1.5,
                  color: Color(0xFF082438),
                ),
              ),
            ),
          ),

          /// Username field
          Positioned(
            left: 12,
            right: 12,
            top: 428,
            child: Container(
              width: screenWidth,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFB9C6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextField(
                hintText: "Username",
                controller: userName,
              ),
            ),
          ),

          /// Password field
          Positioned(
            left: 12,
            right: 12,
            top: 496,
            child: Container(
              width: screenWidth,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFB9C6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextField(hintText: "Password", controller: password,isPassword: true,)
            ),
          ),

          /// Forget password
          Positioned(
            right: 12,
            top: 560,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Forget password?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 15 / 12,
                  decoration: TextDecoration.underline,
                  color: Color(0xFF5E5E5E),
                ),
              ),
            ),
          ),

          /// Login button
          Positioned(
            left: 12,
            top: 595,
            right: 12,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
              },
              child: Container(
                width: screenWidth,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF0096FC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 22 / 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Register text
          Positioned(
            left: 0,
            right: 0,
            top: 663,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Don't have any account? ",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 15 / 12,
                      color: Color(0xFF5E5E5E),
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height: 15 / 12,
                          color: Color(0xFF0096FC),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
