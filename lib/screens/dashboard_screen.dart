import 'package:flutter/material.dart';
import 'package:scube_task_app/model/data_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTab = 0;
  bool _isSourceSelected = true;
  final List<String> _tabTitles = ['Summary', 'SLD', 'Data'];
  final List<DataModel> solarData = [
    DataModel(label: 'Data 1', value: '55505.63'),
    DataModel(label: 'Data 2', value: '58805.63'),
  ];

  final List<DataModel> powerData = [
    DataModel(label: 'Live Power', value: '55505.63 kW'),
    DataModel(label: 'Today Energy', value: '58805.63 kWh'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthScale = screenWidth / 360;
    double heightScale = screenHeight / 836;

    int _selectedTab = 0;

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
        title: Text(
          "SCM",
          // style: TextStyle(
          //   fontFamily: 'Inter',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          //   height: 24 / 16,
          //   color: Color(0xFF04063E),
          // ),
        ),
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
                  // Main Card with Tabs
                  _buildMainCard(
                    screenWidth,
                    screenHeight,
                    widthScale,
                    heightScale,
                  ),

                  SizedBox(height: 20 * heightScale),

                  // Bottom Grid Buttons
                  _buildBottomGrid(screenWidth, widthScale),

                  SizedBox(height: 20 * heightScale),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(
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
          // Tabs
          _buildTabs(),

          _buildSummaryContent(cardWidth, widthScale, heightScale),
        ],
      ),
    );
  }

  Widget _buildTabs() {
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
      child: Row(
        children: List.generate(3, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _selectedTab == index
                      ? const Color(0xFF0096FC)
                      : Colors.transparent,
                  borderRadius: _selectedTab == index
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      : BorderRadius.zero,
                ),
                child: Text(
                  _tabTitles[index],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 17 / 14,
                    fontWeight: _selectedTab == index
                        ? FontWeight.bold
                        : FontWeight.w400,
                    color: _selectedTab == index
                        ? Colors.white
                        : const Color(0xFF646984),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSummaryContent(
    double cardWidth,
    double widthScale,
    double heightScale,
  ) {
    return Column(
      children: [
        // Electricity Section Header
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

        // Circular Progress - Total Power
        SizedBox(
          height: 164,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Circle
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: 100,
                  strokeWidth: 20,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF398FC9),
                  ),
                ),
              ),

              // Center text
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

        // Source / Load Toggle
        buildSourceLoadToggle(widthScale),

        // Divider
        SizedBox(
          width: 288 * widthScale,
          child: const Divider(thickness: 2, color: Color(0xFFA5A7B9)),
        ),

        const SizedBox(height: 6),

        // Scrollable Data List
        _buildDataList(cardWidth, widthScale),
      ],
    );
  }

  Widget buildSourceLoadToggle(double widthScale) {
    return Container(
      width: 288 * widthScale,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [_toggleItem('Source', true), _toggleItem('Load', false)],
      ),
    );
  }

  Widget _toggleItem(String text, bool isSource) {
    final bool isSelected = _isSourceSelected == isSource;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _isSourceSelected = isSource),
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

  Widget _buildDataList(double cardWidth, double widthScale) {
    return SizedBox(
      width: 288 * widthScale,
      height: 229,
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildDataItem(
                'Data View',
                'Active',
                true,
                'assets/solar.png',
                solarData,
                const Color(0xFF78C6FF),
                const Color(0xFFE5F4FE),
              ),
              const SizedBox(height: 8),
              _buildDataItem(
                'Data Type 2',
                'Active',
                true,
                'assets/bettery.png',
                solarData,
                const Color(0xFFFB902E),
                const Color(0xFFE5F4FE),
              ),
              const SizedBox(height: 8),
              _buildDataItem(
                'Data Type 3',
                'Inactive',
                false,
                'assets/tower.png',
                solarData,
                const Color(0xFF78C6FF),
                const Color(0xFFE5F4FE),
              ),
              const SizedBox(height: 8),
              _buildDataItem(
                'Total Solar',
                'Active',
                true,
                'assets/solar.png',
                powerData,
                const Color(0xFF78C6FF),
                const Color(0xFFF0F1FF),
              ),
            ],
          ),

          // Gradient overlay at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
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

          // Custom scrollbar
          Positioned(
            right: 0,
            top: 38,
            child: Container(
              width: 4,
              height: 187,
              decoration: BoxDecoration(
                color: const Color(0xFFB6B8D0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 4,
                  height: 33,
                  margin: const EdgeInsets.only(top: 11),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(
    String title,
    String status,
    bool isActive,
    String iconPath,
    List<DataModel> dataPoints,
    Color indicatorColor,
    Color bgColor,
  ) {
    return Container(
      height: 71,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: const Color(0xFFA5A7B9), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          // Icon
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(iconPath, fit: BoxFit.cover),
          ),

          const SizedBox(width: 14),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title row
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
                        color: isActive
                            ? const Color(0xFF0096FC)
                            : const Color(0xFFDF2222),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                // Data points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dataPoints.map((data) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          // Label
                          Text(
                            data.label,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 15 / 12,
                              color: Color(0xFF646984), // grey
                            ),
                          ),
                          const SizedBox(width: 18,),
                          // Value
                          Text(
                            ': ${data.value}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 15 / 12,
                              color: Color(0xFF04063E), // black
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

          // Arrow
          const Icon(Icons.chevron_right, color: Color(0xFF646984), size: 24),
        ],
      ),
    );
  }

  Widget _buildBottomGrid(double screenWidth, double widthScale) {
    double cardWidth = 148 * widthScale;
    double spacing = 16 * widthScale;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * widthScale),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGridItem(
                'Analysis Pro',
                'assets/analysis.png',
                cardWidth,
              ),
              _buildGridItem(
                'G. Generator',
                'assets/generator.png',
                cardWidth,
              ),
            ],
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGridItem('Plant Summery', 'assets/plant.png', cardWidth),
              _buildGridItem(
                'Natural Gas',
                'assets/gas.png',
                cardWidth,
              ),
            ],
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGridItem(
                'D. Generator',
                'assets/generator.png',
                cardWidth,
              ),
              _buildGridItem('Water Process', 'assets/water.png', cardWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, String iconPath, double width) {
    return GestureDetector(
      onTap: () {
        // Handle navigation
      },
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
