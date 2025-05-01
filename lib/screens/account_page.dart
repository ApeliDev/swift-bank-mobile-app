import 'package:flutter/material.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Accounts', style: TextStyle(color: Colors.white)),
        leading: CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: const Text('LA', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // My Balance Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My balance',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility, color: Colors.white),
                    label: const Text(
                      'Show balance',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // My Accounts Section
              SectionHeader(title: 'My accounts', onViewAll: () {}),
              const SizedBox(height: 10),
              AccountCard(
                title: 'Apeli Solutions',
                balance: '678,283.08 KES',
                details: '7770183562003 • Savings Account',
                color: Colors.red,
              ),
              const SizedBox(height: 20),

              // My PayPal Accounts Section
              SectionHeader(title: 'My PayPal accounts', onViewAll: () {}),
              const SizedBox(height: 10),
              AccountCard(
                title: 'livingstoneapeli@gmail.com',
                balance: '1200.00 USD',
                details: 'Last updated 5 days ago',
                color: Colors.blue,
              ),
              const SizedBox(height: 20),

              // Add Existing Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: const Text(
                        'Add existing\nA bank account, card, mobile wallet or PayPal account',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // My Cards Section
              const Text(
                'My cards',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'You don’t have any cards yet. Link a card right now by tapping Add above.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accounts & Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Equity'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Text('View all', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  final String title;
  final String balance;
  final String details;
  final Color color;

  const AccountCard({
    required this.title,
    required this.balance,
    required this.details,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            balance,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            details,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
