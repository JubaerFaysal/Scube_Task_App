import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:scube_task_app/controllers/energy_dashboard_controller.dart';

class EnergyDataWidgets {
  final EnergyDashboardController controller;

  EnergyDataWidgets(this.controller);

  Widget viewToggle(double screenWidth) {
    return Obx(() => Container(
      width: screenWidth - 48,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA5A7B9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.toggleView(true),
            child: Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: controller.isDataView.value
                          ? const Color(0xFF0096FC)
                          : const Color(0xFFA5A7B9),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isDataView.value
                            ? const Color(0xFF0096FC)
                            : const Color(0xFFA5A7B9),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Data View',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: controller.isDataView.value ? FontWeight.w600 : FontWeight.w400,
                    color: const Color(0xFF646984),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          GestureDetector(
            onTap: () => controller.toggleView(false),
            child: Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: !controller.isDataView.value
                          ? const Color(0xFF0096FC)
                          : const Color(0xFFA5A7B9),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !controller.isDataView.value
                            ? const Color(0xFF0096FC)
                            : const Color(0xFFA5A7B9),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Revenue View',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: !controller.isDataView.value ? FontWeight.w600 : FontWeight.w400,
                    color: !controller.isDataView.value
                        ? const Color(0xFF0096FC)
                        : const Color(0xFF646984),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget gaugeChart(double screenWidth) {
    return Container(
      width: screenWidth - 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Obx(() => SizedBox(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: GaugePainter(progress: controller.gaugeProgress),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.gaugeValue,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: controller.isDataView.value ? 20 : 26,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF04063E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.gaugeUnit,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF04063E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget dataToggle(double screenWidth) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => controller.toggleDataType(true),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: controller.isTodayData.value
                        ? const Color(0xFF0096FC)
                        : const Color(0xFF646984),
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.isTodayData.value
                          ? const Color(0xFF0096FC)
                          : const Color(0xFF646984),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Today Data',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: controller.isTodayData.value ? FontWeight.w600 : FontWeight.w400,
                  color: controller.isTodayData.value
                      ? const Color(0xFF0096FC)
                      : const Color(0xFF646984),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () => controller.toggleDataType(false),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: !controller.isTodayData.value
                        ? const Color(0xFF0096FC)
                        : const Color(0xFF646984),
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: !controller.isTodayData.value
                          ? const Color(0xFF0096FC)
                          : const Color(0xFF646984),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Custom Date Data',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: !controller.isTodayData.value ? FontWeight.w600 : FontWeight.w400,
                  color: !controller.isTodayData.value
                      ? const Color(0xFF0096FC)
                      : const Color(0xFF646984),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget datePickerSection(double screenWidth, BuildContext context) {
    return Container(
      width: screenWidth - 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.selectFromDate(context),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFA5A7B9)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'From Date',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646984),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Color(0xFF646984),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.selectToDate(context),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFA5A7B9)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'To Date',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646984),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Color(0xFF646984),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: controller.searchData,
            child: Container(
              width: 34,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFE2EBF1),
                border: Border.all(color: const Color(0xFF0096FC)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.search,
                size: 18,
                color: Color(0xFF0096FC),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dataCostInfo(double screenWidth) {
    return Obx(() => Container(
      width: screenWidth - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA5A7B9)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: controller.toggleExpanded,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(
                    Icons.bar_chart,
                    color: Color(0xFF646984),
                    size: 22,
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Data & Cost Info',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04063E),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0096FC),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      controller.isExpanded.value
                          ? Icons.keyboard_double_arrow_up
                          : Icons.keyboard_double_arrow_down,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (controller.isExpanded.value)
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFA5A7B9),
            ),
          if (controller.isExpanded.value)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  infoRow('Data 1', '2798.50 (29.53%)', 'Cost 1', '35689 ৳'),
                  const SizedBox(height: 16),
                  infoRow('Data 2', '2798.50 (29.53%)', 'Cost 2', '35689 ৳'),
                  const SizedBox(height: 16),
                  infoRow('Data 3', '2798.50 (29.53%)', 'Cost 3', '35689 ৳'),
                  const SizedBox(height: 16),
                  infoRow('Data 4', '2798.50 (29.53%)', 'Cost 4', '35689 ৳'),
                ],
              ),
            ),
        ],
      ),
    ));
  }

  Widget infoRow(String dataLabel, String dataValue, String costLabel, String costValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              dataLabel,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF646984),
              ),
            ),
            const Text(
              '  :  ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF646984),
              ),
            ),
            Text(
              dataValue,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF04063E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              costLabel,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF646984),
              ),
            ),
            const Text(
              '  :  ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF646984),
              ),
            ),
            Text(
              costValue,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF04063E),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget energyChart(double screenWidth, String energyValue) {
    return Container(
      width: screenWidth - 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA5A7B9)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Energy Chart',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),
              Text(
                energyValue,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          dataRow('Data A', const Color(0xFF0096FC), '2798.50 (29.53%)', '35689 ৳'),
          const SizedBox(height: 4),
          dataRow('Data B', const Color(0xFF7BD7FF), '72598.50 (35.39%)', '5259689 ৳'),
          const SizedBox(height: 4),
          dataRow('Data C', const Color(0xFF9747FF), '6598.36 (83.90%)', '5698756 ৳'),
          const SizedBox(height: 4),
          dataRow('Data D', const Color(0xFFFF9A00), '6598.26 (36.59%)', '356987 ৳'),
        ],
      ),
    );
  }

  Widget dataRow(String label, Color color, String data, String cost) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB6B8D0)),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: const Color(0xFFB6B8D0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Data',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646984))),
                    const Text(' : ',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF646984))),
                    Text(data,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF04063E))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Cost',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646984))),
                    const Text(' : ',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF646984))),
                    Text(cost,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF04063E))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Gauge Painter Widget
class GaugePainter extends CustomPainter {
  final double progress;

  GaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final backgroundPaint = Paint()
      ..color = const Color(0xFF55B4FF).withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 12),
      math.pi * 0.75,
      math.pi * 1.5,
      false,
      backgroundPaint,
    );

    final progressPaint = Paint()
      ..color = const Color(0xFF4E91FD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 12),
      math.pi * 0.75,
      math.pi * 1.5 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}