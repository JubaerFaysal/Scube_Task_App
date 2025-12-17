import 'package:flutter/material.dart';
import 'dart:math' as math;

class EnergyDashboard extends StatefulWidget {
  const EnergyDashboard({super.key});

  @override
  State<EnergyDashboard> createState() => _EnergyDashboardState();
}

class _EnergyDashboardState extends State<EnergyDashboard> {
  bool isDataView = true;
  bool isTodayData = true;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFD9E4F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF04063E)),
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: Stack(
        children: [
          // Full-screen background container
          Positioned.fill(
            top: 40, // keep your top spacing
            child: Container(
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

          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: SizedBox(
              width: screenWidth,
              height: MediaQuery.of(context).size.height +
                  (isTodayData ? 200 : 350), // extra space for scroll
              child: Stack(
                children: [
                  Positioned(top: 20, child: _buildViewToggle(screenWidth)),
                  Positioned(top: 95, child: _buildGaugeChart(screenWidth)),
                  Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    child: Center(child: _buildDataToggle(screenWidth)),
                  ),

                  if (!isTodayData)
                    Positioned(
                      top: 310,
                      left: 0,
                      right: 0,
                      child: _buildDatePickerSection(screenWidth),
                    ),

                  Positioned(
                    top: isTodayData ? 320 : 355,
                    child: Column(
                      children: [
                        _buildEnergyChart(
                          screenWidth,
                          isTodayData ? '5.53 kw' : '20.05 kw',
                        ),
                        if (!isTodayData) ...[
                          const SizedBox(height: 16),
                          _buildEnergyChart(screenWidth, '5.53 kw'),
                        ],
                      ],
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

  Widget _buildViewToggle(double screenWidth) {
    return Container(
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
            onTap: () {
              setState(() {
                isDataView = true;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDataView
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
                        color: isDataView
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
                    fontSize: 16,
                    fontWeight: isDataView ? FontWeight.w600 : FontWeight.w400,
                    color: isDataView
                        ? const Color(0xFF0096FC)
                        : const Color(0xFF646984),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              setState(() {
                isDataView = false;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: !isDataView
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
                        color: !isDataView
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
                    fontSize: 16,
                    fontWeight: !isDataView ? FontWeight.w600 : FontWeight.w400,
                    color: !isDataView
                        ? const Color(0xFF0096FC)
                        : const Color(0xFF646984),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeChart(double screenWidth) {
    return Container(
      width: screenWidth - 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: CustomPaint(
              painter: GaugePainter(progress: isTodayData ? 0.55 : 0.57),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isTodayData ? '55.00' : '57.00',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF04063E),
                      ),
                    ),
                    const Text(
                      'kWh/Sqft',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF04063E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataToggle(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTodayData = true;
            });
          },
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: isTodayData
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
                      color: isTodayData
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
                  fontSize: 14,
                  fontWeight: isTodayData ? FontWeight.w600 : FontWeight.w400,
                  color: isTodayData
                      ? const Color(0xFF0096FC)
                      : const Color(0xFF646984),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () {
            setState(() {
              isTodayData = false;
            });
          },
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: !isTodayData
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
                      color: !isTodayData
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
                  fontSize: 14,
                  fontWeight: !isTodayData ? FontWeight.w600 : FontWeight.w400,
                  color: !isTodayData
                      ? const Color(0xFF0096FC)
                      : const Color(0xFF646984),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickerSection(double screenWidth) {
    return Container(
      width: screenWidth - 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // From Date
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: fromDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    fromDate = date;
                  });
                }
              },
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
          // To Date
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: toDate ?? DateTime.now(),
                  firstDate: fromDate ?? DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    toDate = date;
                  });
                }
              },
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
          // Search Button
          GestureDetector(
            onTap: () {
              // Handle search action
              if (fromDate != null && toDate != null) {
                // Perform search with date range
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Searching from ${fromDate!.toString().split(' ')[0]} to ${toDate!.toString().split(' ')[0]}',
                    ),
                  ),
                );
              }
            },
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

  Widget _buildEnergyChart(double screenWidth, String energyValue) {
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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),
              Text(
                energyValue,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDataRow(
            'Data A',
            const Color(0xFF0096FC),
            '2798.50 (29.53%)',
            '35689 ৳',
          ),
          const SizedBox(height: 4),
          _buildDataRow(
            'Data B',
            const Color(0xFF7BD7FF),
            '72598.50 (35.39%)',
            '5259689 ৳',
          ),
          const SizedBox(height: 4),
          _buildDataRow(
            'Data C',
            const Color(0xFF9747FF),
            '6598.36 (83.90%)',
            '5698756 ৳',
          ),
          const SizedBox(height: 4),
          _buildDataRow(
            'Data D',
            const Color(0xFFFF9A00),
            '6598.26 (36.59%)',
            '356987 ৳',
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, Color color, String data, String cost) {
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
                    const Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646984),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF646984),
                      ),
                    ),
                    Text(
                      data,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF04063E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Cost',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646984),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF646984),
                      ),
                    ),
                    Text(
                      cost,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF04063E),
                      ),
                    ),
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

class GaugePainter extends CustomPainter {
  final double progress;

  GaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background arc
    final backgroundPaint = Paint()
      ..color = const Color(0xFFD9E4F1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      math.pi * 0.75,
      math.pi * 1.5,
      false,
      backgroundPaint,
    );

    // Progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF4E91FD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      math.pi * 0.75,
      math.pi * 1.5 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  }