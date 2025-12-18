import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/controllers/dashboard_controller.dart';
import 'package:scube_task_app/screens/dashboard_screen/widgets/dashboard_widgets.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final controller = Get.put(DashboardController());
  late final widgets = DashboardWidgets(controller);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthScale = screenWidth / 360;
    double heightScale = screenHeight / 836;

    return Scaffold(
      backgroundColor: const Color(0xFFD9E4F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF04063E)),
          onPressed: () => Get.back(),
        ),
        title: const Text("SCM"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF646984),
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 15,
                top: 12,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDF2222),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 12 * heightScale),
                  widgets.mainCard(screenWidth, screenHeight, widthScale, heightScale),
                  SizedBox(height: 20 * heightScale),
                  widgets.buildBottomGrid(screenWidth, widthScale),
                  SizedBox(height: 20 * heightScale),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}