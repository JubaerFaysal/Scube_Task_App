import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthScale = screenWidth / 360;
    double heightScale = screenHeight / 800;

    return Scaffold(
      backgroundColor: const Color(0xFF0096FC),
      body: Stack(
        children: [
          /// bottom section
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * (336 / 800),
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
            top: screenHeight * (80 / 800),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 96 * widthScale,
                height: 98 * heightScale,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset("assets/img.png", fit: BoxFit.cover),
              ),
            ),
          ),

          ///title
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * (198 / 800),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "SCUBE\n",
                    style: GoogleFonts.inter(
                      fontSize: 24 * widthScale,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: "Control & Monitoring System",
                    style: GoogleFonts.inter(
                      fontSize: 20 * widthScale,
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
            top: screenHeight * (368 / 800),
            child: Center(
              child: Text(
                'Login',
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 24 * widthScale,
                  height: 1.5,
                  letterSpacing: 0,
                  color: Color(0xFF082438),
                ),
              ),
            ),
          ),

          /// Username field
          Positioned(
            left: 12,
            right: 12,
            top: screenHeight * (428 / 800),
            child: Container(
              width: screenWidth,
              height: 56 * heightScale,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFB9C6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextField(
                hintText: "Username",
                controller: controller.userNameController,
              ),
            ),
          ),

          /// Password field
          Positioned(
            left: 12,
            right: 12,
            top: screenHeight * (496 / 800),
            child: Container(
              width: screenWidth,
              height: 56 * heightScale,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFB9C6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextField(
                hintText: "Password",
                controller: controller.passwordController,
                isPassword: true,
              ),
            ),
          ),

          /// Forget password
          Positioned(
            right: 12,
            top: screenHeight * (560 / 800),
            child: GestureDetector(
              onTap: controller.forgotPassword,
              child: Text(
                'Forget password?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 12 * widthScale,
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
            top: screenHeight * (595 / 800),
            right: 12,
            child: GestureDetector(
              onTap: controller.login,
              child: Container(
                width: screenWidth,
                height: 60 * heightScale,
                decoration: BoxDecoration(
                  color: const Color(0xFF0096FC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18 * widthScale,
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
            top: screenHeight * (663 / 800),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have any account? ",
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12 * widthScale,
                      height: 15 / 12,
                      color: const Color(0xFF5E5E5E),
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: controller.register,
                      child: Text(
                        'Register Now',
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 14 * widthScale,
                          height: 15 / 12,
                          color: const Color(0xFF0096FC),
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