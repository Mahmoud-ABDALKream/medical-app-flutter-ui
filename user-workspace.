import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/bottom_navigation.dart';

/// Main dashboard screen that displays user's medical overview
/// Includes quick stats, recent activities, and navigation options
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

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
              // Header section with greeting and profile
              _buildHeader(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Quick stats cards
              _buildQuickStats(context, screenWidth, screenHeight),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Recent activities section
              _buildRecentActivities(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Health metrics section
              _buildHealthMetrics(context, screenWidth, screenHeight),
              
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

  /// Build header section with greeting and profile picture
  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        Row(
          children: [
            // Notification icon
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
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF666666),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Profile picture
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF4285F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build quick stats cards section
  Widget _buildQuickStats(BuildContext context, double screenWidth, double screenHeight) {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4285F4).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Color(0xFF4285F4),
                        size: 20,
                      ),
                    ),
                    const Icon(
                      Icons.trending_up,
                      color: Color(0xFF10B981),
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '72',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Heart Rate',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.directions_walk,
                        color: Color(0xFF10B981),
                        size: 20,
                      ),
                    ),
                    const Icon(
                      Icons.trending_up,
                      color: Color(0xFF10B981),
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '8,547',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Steps',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Build recent activities section
  Widget _buildRecentActivities(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            TextButton(
              onPressed: () {},
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
            children: [
              _buildActivityItem(
                icon: Icons.medical_services,
                title: 'Doctor Appointment',
                subtitle: 'Dr. Smith - Cardiology',
                time: '2 hours ago',
                iconColor: const Color(0xFF4285F4),
              ),
              const Divider(height: 24),
              _buildActivityItem(
                icon: Icons.medication,
                title: 'Medication Reminder',
                subtitle: 'Take your morning pills',
                time: '4 hours ago',
                iconColor: const Color(0xFF10B981),
              ),
              const Divider(height: 24),
              _buildActivityItem(
                icon: Icons.fitness_center,
                title: 'Workout Completed',
                subtitle: '30 min cardio session',
                time: '6 hours ago',
                iconColor: const Color(0xFFFF6B35),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build individual activity item
  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF999999),
          ),
        ),
      ],
    );
  }

  /// Build health metrics section
  Widget _buildHealthMetrics(BuildContext context, double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Metrics',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Blood Pressure',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '120/80',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '68.5',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'kg',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
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
        // Already on dashboard
        break;
      case 1:
        Navigator.pushNamed(context, '/health-dashboard');
        break;
      case 2:
        Navigator.pushNamed(context, '/payment');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
