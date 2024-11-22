
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../widgets/bottomNavBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _email = prefs.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
              radius: 50.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              _name ?? '',
              style: const TextStyle(fontSize: 24.0),
            ),
            Text(
              _email ?? '',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to Order History page
              },
              child: const Text('Order History', style: TextStyle(color: Colors.green),),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to Shopping Lists page
              },
              child: const Text('Shopping Lists', style: TextStyle(color: Colors.green),),
            ),
            const SizedBox(height: 16.0),
            // TextButton(
            //   onPressed: () {
            //     // Navigate to Loyalty Program page
            //   },
            //   child: const Text('Loyalty Program', style: TextStyle(color: Colors.green),),
            // ),
            // const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to Payment Methods page
              },
              child: const Text('Payment Methods', style: TextStyle(color: Colors.green),),
            ),
            // const SizedBox(height: 16.0),
            // TextButton(
            //   onPressed: () {
            //     // Navigate to Settings page
            //   },
            //   child: const Text('Settings', style: TextStyle(color: Colors.green),),
            // ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Open Help and Support page or contact customer support
              },
              child: const Text('Help and Support', style: TextStyle(color: Colors.green),),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.share),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () {
                    // Open refer a friend page
                  },
                  child: const Text('Refer a Friend', style: TextStyle(color: Colors.green),),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to Ratings and Reviews page
              },
              child: const Text('Rate and Review', style: TextStyle(color: Colors.green),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
