import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_button.dart';

/// Health dashboard screen that displays detailed health metrics and charts
/// Matches the health monitoring interface from the design
class HealthDashboardScreen extends StatefulWidget {
  const HealthDashboardScreen({super.key});

  @override
  State<HealthDashboardScreen> createState() => _HealthDashboardScreenState();
}

class _HealthDashboardScreenState extends State<HealthDashboardScreen> {
  int _selectedIndex = 1; // Health tab selected
  int _selectedTabIndex = 0;
  
  final List<String> _tabs = ['Overview', 'Heart Rate', 'Steps', 'Sleep'];

  // Sample health data
  final List<Map<String, dynamic>> _healthMetrics = [
    {
      'title': 'Heart Rate',
      'value': '72',
      'unit': 'bpm',
      'icon': Icons.favorite,
      'color': Color(0xFFE53E3E),
      'trend': 'Normal',
      'isGood': true,
    },
    {
      'title': 'Blood Pressure',
      'value': '120/80',
      'unit': 'mmHg',
      'icon': Icons.monitor_heart,
      'color': Color(0xFF4285F4),
      'trend': 'Optimal',
      'isGood': true,
    },
    {
      'title': 'Steps Today',
      'value': '8,547',
      'unit': 'steps',
      'icon': Icons.directions_walk,
      'color': Color(0xFF10B981),
      'trend': '+12% from yesterday',
      'isGood': true,
    },
    {
      'title': 'Sleep Quality',
      'value': '7.5',
      'unit': 'hours',
      'icon': Icons.bedtime,
      'color': Color(0xFF8B5CF6),
      'trend': 'Good quality',
      'isGood': true,
    },
  ];

  final List<Map<String, dynamic>> _recentReadings = [
    {
      'type': 'Blood Pressure',
      'value': '118/76 mmHg',
      'time': '2 hours ago',
      'status': 'Normal',
      'icon': Icons.monitor_heart,
      'color': Color(0xFF4285F4),
    },
    {
      'type': 'Heart Rate',
      'value': '68 bpm',
      'time': '4 hours ago',
      'status': 'Normal',
      'icon': Icons.favorite,
      'color': Color(0xFFE53E3E),
    },
    {
      'type': 'Weight',
      'value': '68.2 kg',
      'time': '1 day ago',
      'status': 'Stable',
      'icon': Icons.monitor_weight,
      'color': Color(0xFF10B981),
    },
    {
      'type': 'Temperature',
      'value': '36.8°C',
      'time': '2 days ago',
      'status': 'Normal',
      'icon': Icons.thermostat,
      'color': Color(0xFFFF6B35),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Tab bar
              _buildTabBar(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Health metrics grid
              _buildHealthMetrics(context, screenWidth, screenHeight),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Chart section
              _buildChartSection(context, screenWidth, screenHeight),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Recent readings
              _buildRecentReadings(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _handleNavigation(context, index);
        },
      ),
    );
  }

  /// Build header section
  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Dashboard',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Track your wellness journey',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF666666),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  // Handle sync data
                },
                icon: const Icon(
                  Icons.sync,
                  color: Color(0xFF4285F4),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  // Handle settings
                },
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build tab bar
  Widget _buildTabBar(BuildContext context, double screenWidth) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = _selectedTabIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected 
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFF666666),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Build health metrics grid
  Widget _buildHealthMetrics(BuildContext context, double screenWidth, double screenHeight) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: _healthMetrics.length,
      itemBuilder: (context, index) {
        final metric = _healthMetrics[index];
        return StatCard(
          title: metric['title'],
          value: metric['value'],
          unit: metric['unit'],
          icon: metric['icon'],
          iconColor: metric['color'],
          showTrend: true,
          isIncreasing: metric['isGood'],
        );
      },
    );
  }

  /// Build chart section
  Widget _buildChartSection(BuildContext context, double screenWidth, double screenHeight) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heart Rate Trend',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF4285F4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '7 Days',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4285F4),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Simplified chart representation
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                // Chart background grid
                CustomPaint(
                  size: Size(double.infinity, 120),
                  painter: _ChartGridPainter(),
                ),
                // Chart line
                CustomPaint(
                  size: Size(double.infinity, 120),
                  painter: _HeartRateChartPainter(),
                ),
                // Chart labels
                Positioned(
                  bottom: 8,
                  left: 16,
                  child: Text(
                    'Mon',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 16,
                  child: Text(
                    'Sun',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF4285F4),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Average: 72 bpm',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
              const Spacer(),
              const Text(
                'Range: 65-85 bpm',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build recent readings section
  Widget _buildRecentReadings(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Readings',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle view all readings
              },
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomCard(
          child: Column(
            children: _recentReadings.asMap().entries.map((entry) {
              final index = entry.key;
              final reading = entry.value;
              
              return Column(
                children: [
                  _buildReadingItem(reading),
                  if (index < _recentReadings.length - 1)
                    const Divider(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Build individual reading item
  Widget _buildReadingItem(Map<String, dynamic> reading) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: reading['color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            reading['icon'],
            color: reading['color'],
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reading['type'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                reading['value'],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                reading['status'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF10B981),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              reading['time'],
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Handle bottom navigation
  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        // Already on health dashboard
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/payment');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
}

/// Custom painter for chart grid
class _ChartGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..strokeWidth = 0.5;

    // Draw horizontal grid lines
    for (int i = 0; i <= 4; i++) {
      final y = (size.height / 4) * i;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Draw vertical grid lines
    for (int i = 0; i <= 6; i++) {
      final x = (size.width / 6) * i;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painter for heart rate chart
class _HeartRateChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    // Sample heart rate data points
    final points = [
      Offset(size.width * 0.1, size.height * 0.6),
      Offset(size.width * 0.25, size.height * 0.4),
      Offset(size.width * 0.4, size.height * 0.5),
      Offset(size.width * 0.55, size.height * 0.3),
      Offset(size.width * 0.7, size.height * 0.45),
      Offset(size.width * 0.85, size.height * 0.35),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    
    for (int i = 1; i < points.length; i++) {
      final controlPoint1 = Offset(
        points[i - 1].dx + (points[i].dx - points[i - 1].dx) * 0.5,
        points[i - 1].dy,
      );
      final controlPoint2 = Offset(
        points[i - 1].dx + (points[i].dx - points[i - 1].dx) * 0.5,
        points[i].dy,
      );
      
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        points[i].dx,
        points[i].dy,
      );
    }

    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 4, pointPaint);
      canvas.drawCircle(point, 4, Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill);
      canvas.drawCircle(point, 2, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
