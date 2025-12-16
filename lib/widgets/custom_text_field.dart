import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthScale = screenWidth / 360;
    double heightScale = screenHeight / 800;
    return Container(
      height: 56*heightScale,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB9C6D6), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: 14*widthScale,
            fontWeight: FontWeight.w400,
            height: 17 / 14,
            color: const Color(0xFF5E5E5E),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12*widthScale, vertical: 20*heightScale),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: const Color(0xFF82797A),
              size: 18*widthScale,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          )
              : null,
        ),
        style: GoogleFonts.inter(
          fontSize: 14*widthScale,
          color: const Color(0xFF082438),
        ),
      ),
    );
  }
}
