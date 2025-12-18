import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/controllers/dashboard_controller.dart';
import 'package:scube_task_app/model/data_model.dart';
import 'package:scube_task_app/screens/empty_screen.dart';
import 'package:scube_task_app/screens/energy_data_screen/energy_data_screen.dart';


class DashboardWidgets {
  final DashboardController controller;

  DashboardWidgets(this.controller);

  Widget mainCard(
      double screenWidth,
      double screenHeight,
      double widthScale,
      double heightScale,
      ) {
    double cardWidth = 312 * widthScale;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB6B8D0), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          tabs(),
          summaryContent(cardWidth, widthScale, heightScale),
        ],
      ),
    );
  }

  Widget tabs() {
    return Container(
      height: 39,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB6B8D0)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(11),
          topRight: Radius.circular(11),
        ),
      ),
      child: Obx(() => Row(
        children: List.generate(3, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.changeTab(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: controller.selectedTab.value == index
                      ? const Color(0xFF0096FC)
                      : Colors.transparent,
                  borderRadius: controller.selectedTab.value == index
                      ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                      : BorderRadius.zero,
                ),
                child: Text(
                  controller.tabTitles[index],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 17 / 14,
                    fontWeight: controller.selectedTab.value == index
                        ? FontWeight.bold
                        : FontWeight.w400,
                    color: controller.selectedTab.value == index
                        ? Colors.white
                        : const Color(0xFF646984),
                  ),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }

  Widget summaryContent(
      double cardWidth,
      double widthScale,
      double heightScale,
      ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              const Text(
                'Electricity',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 19 / 16,
                  color: Color(0xFF979797),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 296 * widthScale,
                child: const Divider(thickness: 1, color: Color(0xFF979797)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 164,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: 100,
                  strokeWidth: 20,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF398FC9)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Total Power',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 15 / 12,
                      color: Color(0xFF04063E),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '5.53 kw',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 19 / 16,
                      color: Color(0xFF04063E),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        sourceLoadToggle(widthScale),
        SizedBox(
          width: 288 * widthScale,
          child: const Divider(thickness: 2, color: Color(0xFFA5A7B9)),
        ),
        const SizedBox(height: 6),
        dataList(widthScale),
      ],
    );
  }

  Widget sourceLoadToggle(double widthScale) {
    return Obx(() => Container(
      width: 288 * widthScale,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          toggleItem('Source', true, widthScale),
          toggleItem('Load', false, widthScale),
        ],
      ),
    ));
  }

  Widget toggleItem(String text, bool isSource, double widthScale) {
    final bool isSelected = controller.isSourceSelected.value == isSource;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.toggleSource(isSource),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0096FC) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              height: 19 / 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.white : const Color(0xFF646984),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataList(double widthScale) {
    return SizedBox(
      width: 290 * widthScale,
      height: 229,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 10,
            bottom: 0,
            child: ListView(
              controller: controller.scrollController,
              padding: EdgeInsets.zero,
              children: [
                dataItem(
                  'Data View',
                  'Active',
                  true,
                  'assets/solar.png',
                  controller.solarData,
                  const Color(0xFF78C6FF),
                  const Color(0xFFE5F4FE),
                      () => Get.to(() => EnergyDashboard()),
                ),
                const SizedBox(height: 8),
                dataItem(
                  'Data Type 2',
                  'Active',
                  true,
                  'assets/bettery.png',
                  controller.solarData,
                  const Color(0xFFFB902E),
                  const Color(0xFFE5F4FE),
                      () {},
                ),
                const SizedBox(height: 8),
                dataItem(
                  'Data Type 3',
                  'Inactive',
                  false,
                  'assets/tower.png',
                  controller.solarData,
                  const Color(0xFF78C6FF),
                  const Color(0xFFE5F4FE),
                      () {},
                ),
                const SizedBox(height: 8),
                dataItem(
                  'Total Solar',
                  'Active',
                  true,
                  'assets/solar.png',
                  controller.powerData,
                  const Color(0xFF78C6FF),
                  const Color(0xFFF0F1FF),
                      () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 8,
            child: IgnorePointer(
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF19416E).withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 10,
            bottom: 10,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFB6B8D0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 11,
                    child: Container(
                      width: 4,
                      height: 33,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF4E91FD), Color(0xFF080B7F)],
                        ),
                        borderRadius: BorderRadius.circular(4),
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

  Widget dataItem(
      String title,
      String status,
      bool isActive,
      String iconPath,
      List<DataModel> dataPoints,
      Color indicatorColor,
      Color bgColor,
      VoidCallback? onTap,
      ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 71,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: const Color(0xFFA5A7B9), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(iconPath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 17 / 14,
                          color: Color(0xFF04063E),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '($status)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          height: 12 / 10,
                          color: isActive ? const Color(0xFF0096FC) : const Color(0xFFDF2222),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dataPoints.map((data) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Row(
                          children: [
                            Text(
                              data.label,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 15 / 12,
                                color: Color(0xFF646984),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              ': ${data.value}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 15 / 12,
                                color: Color(0xFF04063E),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF646984), size: 24),
          ],
        ),
      ),
    );
  }

  Widget buildBottomGrid(double screenWidth, double widthScale) {
    double cardWidth = 148 * widthScale;
    double spacing = 16 * widthScale;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * widthScale),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildGridItem('Analysis Pro', 'assets/analysis.png', cardWidth),
              buildGridItem('G. Generator', 'assets/generator.png', cardWidth),
            ],
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildGridItem('Plant Summery', 'assets/plant.png', cardWidth),
              buildGridItem('Natural Gas', 'assets/gas.png', cardWidth),
            ],
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildGridItem('D. Generator', 'assets/generator.png', cardWidth),
              buildGridItem('Water Process', 'assets/water.png', cardWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(String title, String iconPath, double width) {
    return GestureDetector(
      onTap: () => Get.to(() => EmptyScreen()),
      child: Container(
        width: width,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFB6B8D0), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(iconPath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 17 / 14,
                  color: Color(0xFF646984),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}