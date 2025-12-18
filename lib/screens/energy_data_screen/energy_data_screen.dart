import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/controllers/energy_dashboard_controller.dart';
import 'package:scube_task_app/screens/energy_data_screen/widgets/energy_data_widgets.dart';


class EnergyDashboard extends StatelessWidget {
  EnergyDashboard({super.key});

  final controller = Get.put(EnergyDashboardController());
  late final widgets = EnergyDataWidgets(controller);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFD9E4F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.05),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF04063E)),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "SCM",
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF04063E),
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF646984),
                  size: 20,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
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
      body: Stack(
        children: [
          Positioned.fill(
            top: 40,
            child: Container(
              height: screenHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFA5A7B9)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                widgets.viewToggle(screenWidth),
                const SizedBox(height: 16),
                widgets.gaugeChart(screenWidth),
                const SizedBox(height: 24),
                Obx(() {
                  if (controller.isDataView.value) {
                    return Column(
                      children: [
                        widgets.dataToggle(screenWidth),
                        const SizedBox(height: 16),
                        if (!controller.isTodayData.value) ...[
                          widgets.datePickerSection(screenWidth, context),
                          const SizedBox(height: 16),
                        ],
                        widgets.energyChart(
                          screenWidth,
                          controller.isTodayData.value ? '5.53 kw' : '20.05 kw',
                        ),
                        if (!controller.isTodayData.value) ...[
                          const SizedBox(height: 16),
                          widgets.energyChart(screenWidth, '5.53 kw'),
                        ],
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const SizedBox(height: 24),
                        widgets.dataCostInfo(screenWidth),
                      ],
                    );
                  }
                }),
                const SizedBox(height: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}