import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({
    super.key,
  });

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  void initState() {
    context.read<UserProvider>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();
    if (provider.universityLogo == null || provider.userImage == null) return Placeholder();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserProvider>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
