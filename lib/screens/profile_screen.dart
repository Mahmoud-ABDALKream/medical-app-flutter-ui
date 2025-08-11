import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/bottom_navigation.dart';

/// Profile screen that displays user information and settings
/// Matches the profile interface from the design with user details and options
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Profile tab selected
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _biometricEnabled = true;

  // Sample user data
  final Map<String, dynamic> _userData = {
    'name': 'John Doe',
    'email': 'john.doe@email.com',
    'phone': '+1 (555) 123-4567',
    'dateOfBirth': 'March 15, 1990',
    'bloodType': 'O+',
    'height': '175 cm',
    'weight': '68.5 kg',
    'emergencyContact': 'Jane Doe - +1 (555) 987-6543',
  };

  // Profile menu items
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Medical Records',
      'subtitle': 'View your health history',
      'icon': Icons.medical_services,
      'color': Color(0xFF4285F4),
      'route': '/medical-records',
    },
    {
      'title': 'Appointments',
      'subtitle': 'Manage your appointments',
      'icon': Icons.calendar_today,
      'color': Color(0xFF10B981),
      'route': '/appointments',
    },
    {
      'title': 'Insurance',
      'subtitle': 'Insurance information',
      'icon': Icons.security,
      'color': Color(0xFF8B5CF6),
      'route': '/insurance',
    },
    {
      'title': 'Emergency Contacts',
      'subtitle': 'Manage emergency contacts',
      'icon': Icons.contact_emergency,
      'color': Color(0xFFE53E3E),
      'route': '/emergency-contacts',
    },
    {
      'title': 'Privacy & Security',
      'subtitle': 'Manage your privacy settings',
      'icon': Icons.privacy_tip,
      'color': Color(0xFFFF6B35),
      'route': '/privacy',
    },
    {
      'title': 'Help & Support',
      'subtitle': 'Get help and support',
      'icon': Icons.help_outline,
      'color': Color(0xFF666666),
      'route': '/support',
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
              
              // Profile card
              _buildProfileCard(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Quick stats
              _buildQuickStats(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Settings section
              _buildSettingsSection(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Menu items
              _buildMenuItems(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Logout button
              _buildLogoutButton(context),
              
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
              'Profile',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage your account',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF666666),
              ),
            ),
          ],
        ),
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
              // Handle edit profile
              _showEditProfileDialog(context);
            },
            icon: const Icon(
              Icons.edit,
              color: Color(0xFF4285F4),
            ),
          ),
        ),
      ],
    );
  }

  /// Build profile card
  Widget _buildProfileCard(BuildContext context, double screenWidth) {
    return CustomCard(
      child: Row(
        children: [
          // Profile picture
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4285F4),
                  Color(0xFF34A853),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
          
          const SizedBox(width: 20),
          
          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userData['name'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _userData['email'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: const Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Verified Account',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF10B981),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // QR code icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF4285F4).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.qr_code,
              color: Color(0xFF4285F4),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  /// Build quick stats section
  Widget _buildQuickStats(BuildContext context, double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4285F4).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF4285F4),
                    size: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '12',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
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
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.medical_services,
                    color: Color(0xFF10B981),
                    size: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '8',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Records',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
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
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B35).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Color(0xFFFF6B35),
                    size: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '95%',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Health Score',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
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

  /// Build settings section
  Widget _buildSettingsSection(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        CustomCard(
          child: Column(
            children: [
              _buildSettingItem(
                title: 'Notifications',
                subtitle: 'Receive health reminders',
                icon: Icons.notifications,
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: const Color(0xFF4285F4),
                ),
              ),
              const Divider(height: 24),
              _buildSettingItem(
                title: 'Dark Mode',
                subtitle: 'Switch to dark theme',
                icon: Icons.dark_mode,
                trailing: Switch(
                  value: _darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _darkModeEnabled = value;
                    });
                  },
                  activeColor: const Color(0xFF4285F4),
                ),
              ),
              const Divider(height: 24),
              _buildSettingItem(
                title: 'Biometric Login',
                subtitle: 'Use fingerprint or face ID',
                icon: Icons.fingerprint,
                trailing: Switch(
                  value: _biometricEnabled,
                  onChanged: (value) {
                    setState(() {
                      _biometricEnabled = value;
                    });
                  },
                  activeColor: const Color(0xFF4285F4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build individual setting item
  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget trailing,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF4285F4).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4285F4),
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
        trailing,
      ],
    );
  }

  /// Build menu items section
  Widget _buildMenuItems(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Options',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        CustomCard(
          child: Column(
            children: _menuItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              
              return Column(
                children: [
                  _buildMenuItem(item),
                  if (index < _menuItems.length - 1)
                    const Divider(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Build individual menu item
  Widget _buildMenuItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        // Handle menu item tap
        Navigator.pushNamed(context, item['route']);
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: item['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item['icon'],
                color: item['color'],
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['subtitle'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF999999),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  /// Build logout button
  Widget _buildLogoutButton(BuildContext context) {
    return CustomButton(
      text: 'Logout',
      onPressed: () {
        _showLogoutDialog(context);
      },
      backgroundColor: const Color(0xFFE53E3E),
      textColor: Colors.white,
    );
  }

  /// Show edit profile dialog
  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('Profile editing functionality would be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  /// Show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Color(0xFFE53E3E)),
            ),
          ),
        ],
      ),
    );
  }

  /// Handle bottom navigation
  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/health-dashboard');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/payment');
        break;
      case 3:
        // Already on profile screen
        break;
    }
  }
}
