import 'package:flutter/material.dart';
import 'account_page.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1B1B),
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning, Apeli',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickAction(Icons.send, 'Send to\nSwift', Colors.red, context, EquityPage()),
                _buildQuickAction(Icons.mobile_friendly, 'Send to\nMobile', Colors.red, context, MobilePage()),
                _buildQuickAction(Icons.person, 'Send to\nAnother', Colors.red, context, AnotherPage()),
                _buildQuickAction(Icons.receipt, 'Pay\nBills', Colors.red, context, PayBillsPage()),
                _buildQuickAction(Icons.shopping_cart, 'Buy\nGoods', Colors.red, context, BuyGoodsPage()),
              ],
            ),

            const SizedBox(height: 20),

            // My Balance Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My balance',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Show balance',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.visibility,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Action Cards Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionCard(Icons.transform, 'Transact', context, TransactPage()),
                _buildActionCard(Icons.account_balance_wallet, 'Borrow', context, BorrowPage()),
                _buildActionCard(Icons.savings, 'Save', context, SavePage()),
              ],
            ),

            const SizedBox(height: 20),

            // My Accounts Section
            const Text(
              'My accounts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Apeli Solutions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '678,283.08 KES',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '7770183562003 · Savings Account',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1B1B1B),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Accounts & Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Swift',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountsPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EquityPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              break;
          }
        },
      ),
    );
  }

  // Widget for Quick Actions
  Widget _buildQuickAction(IconData icon, String label, Color color, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Widget for Action Cards
  Widget _buildActionCard(IconData icon, String label, BuildContext context, Widget page) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.red, size: 28),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder Pages
class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounts & Cards')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/account');
          },
          child: const Text('Go to accounts'),
        ),
      ),
    );
  }
}

class EquityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swift')),
      body: const Center(child: Text('Swift Page')),
    );
  }
}

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile')),
      body: const Center(child: Text('Mobile Page')),
    );
  }
}
class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Another')),
      body: Center(child: const Text('Another Page')),
    );
  }
}

class PayBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills')),
      body: Center(child: const Text('Pay Bills Page')),
    );
  }
}

class BuyGoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buy Goods')),
      body: Center(child: const Text('Buy Goods Page')),
    );
  }
}

class TransactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transact')),
      body: Center(child: const Text('Transact Page')),
    );
  }
}

class BorrowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Borrow')),
      body: Center(child: const Text('Borrow Page')),
    );
  }
}

class SavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save')),
      body: Center(child: const Text('Save Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(child: const Text('Settings Page')),
    );
  }
}
