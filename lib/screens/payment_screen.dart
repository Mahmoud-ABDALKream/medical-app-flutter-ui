import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/bottom_navigation.dart';

/// Payment screen that displays payment cards and transaction history
/// Matches the payment interface from the design with card carousel and transactions
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 2; // Payment tab selected
  int _selectedCardIndex = 0;
  final PageController _pageController = PageController();

  // Sample payment cards data
  final List<Map<String, dynamic>> _paymentCards = [
    {
      'cardNumber': '**** **** **** 1234',
      'cardHolder': 'JOHN DOE',
      'expiryDate': '12/25',
      'balance': '\$500.00',
      'color': const Color(0xFF4285F4),
    },
    {
      'cardNumber': '**** **** **** 5678',
      'cardHolder': 'JOHN DOE',
      'expiryDate': '08/26',
      'balance': '\$1,250.00',
      'color': const Color(0xFF10B981),
    },
    {
      'cardNumber': '**** **** **** 9012',
      'cardHolder': 'JOHN DOE',
      'expiryDate': '03/27',
      'balance': '\$750.00',
      'color': const Color(0xFFFF6B35),
    },
  ];

  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Dr. Smith Consultation',
      'subtitle': 'Cardiology Department',
      'amount': '-\$150.00',
      'date': 'Today',
      'icon': Icons.medical_services,
      'iconColor': Color(0xFF4285F4),
      'isExpense': true,
    },
    {
      'title': 'Pharmacy Purchase',
      'subtitle': 'Medication refill',
      'amount': '-\$45.50',
      'date': 'Yesterday',
      'icon': Icons.medication,
      'iconColor': Color(0xFF10B981),
      'isExpense': true,
    },
    {
      'title': 'Insurance Refund',
      'subtitle': 'Health insurance claim',
      'amount': '+\$200.00',
      'date': '2 days ago',
      'icon': Icons.account_balance,
      'iconColor': Color(0xFF10B981),
      'isExpense': false,
    },
    {
      'title': 'Lab Test',
      'subtitle': 'Blood work analysis',
      'amount': '-\$85.00',
      'date': '3 days ago',
      'icon': Icons.science,
      'iconColor': Color(0xFFFF6B35),
      'isExpense': true,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
              
              // Payment cards carousel
              _buildPaymentCards(context, screenWidth, screenHeight),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Quick actions
              _buildQuickActions(context, screenWidth),
              
              SizedBox(height: screenHeight * 0.03),
              
              // Recent transactions
              _buildRecentTransactions(context, screenWidth),
              
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
              'My Wallet',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage your payments',
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
              // Handle add card
            },
            icon: const Icon(
              Icons.add,
              color: Color(0xFF4285F4),
            ),
          ),
        ),
      ],
    );
  }

  /// Build payment cards carousel
  Widget _buildPaymentCards(BuildContext context, double screenWidth, double screenHeight) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedCardIndex = index;
              });
            },
            itemCount: _paymentCards.length,
            itemBuilder: (context, index) {
              final card = _paymentCards[index];
              return PaymentCard(
                cardNumber: card['cardNumber'],
                cardHolder: card['cardHolder'],
                expiryDate: card['expiryDate'],
                balance: card['balance'],
                cardColor: card['color'],
                isSelected: _selectedCardIndex == index,
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Card indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _paymentCards.asMap().entries.map((entry) {
            final index = entry.key;
            final isSelected = _selectedCardIndex == index;
            
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected 
                    ? const Color(0xFF4285F4)
                    : const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }).toList(),
        ),
        
        const SizedBox(height: 16),
        
        // Balance display
        CustomCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _paymentCards[_selectedCardIndex]['balance'],
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF4285F4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFF4285F4),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build quick actions section
  Widget _buildQuickActions(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
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
              child: _buildActionButton(
                icon: Icons.add,
                label: 'Top Up',
                color: const Color(0xFF4285F4),
                onTap: () {
                  // Handle top up
                },
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: _buildActionButton(
                icon: Icons.send,
                label: 'Transfer',
                color: const Color(0xFF10B981),
                onTap: () {
                  // Handle transfer
                },
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: _buildActionButton(
                icon: Icons.receipt,
                label: 'Bills',
                color: const Color(0xFFFF6B35),
                onTap: () {
                  // Handle bills
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build individual action button
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  /// Build recent transactions section
  Widget _buildRecentTransactions(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle view all transactions
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
            children: _transactions.asMap().entries.map((entry) {
              final index = entry.key;
              final transaction = entry.value;
              
              return Column(
                children: [
                  _buildTransactionItem(transaction),
                  if (index < _transactions.length - 1)
                    const Divider(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Build individual transaction item
  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: transaction['iconColor'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            transaction['icon'],
            color: transaction['iconColor'],
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction['title'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction['subtitle'],
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
            Text(
              transaction['amount'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: transaction['isExpense'] 
                    ? const Color(0xFFE53E3E)
                    : const Color(0xFF10B981),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              transaction['date'],
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
        Navigator.pushReplacementNamed(context, '/health-dashboard');
        break;
      case 2:
        // Already on payment screen
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
}
