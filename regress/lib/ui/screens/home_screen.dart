import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:regress/ui/screens/group_screen.dart';
import 'package:regress/ui/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserProvider>().loadData();
    super.initState();
  }

  int _currentIndex = 0;
  final List<Widget> _screens = [
    GroupScreen(),
    Center(child: Text("Notes")),
    Center(child: Text("Assessments")),
    Center(child: Text("Subjects")),
    StudentProfileScreen()
  ];

  final List<String> _titles = [
    "Groups and sections",
    "Exam Notes",
    "Assessments",
    "Subjects",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.red,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: "Groups",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "Assessments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: "Subjects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
