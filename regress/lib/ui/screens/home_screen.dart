import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:regress/ui/screens/exam_notes.dart';
import 'package:regress/ui/screens/group_screen.dart';
import 'package:regress/ui/screens/modules_screen.dart';
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
    ModulesScreen(),
    GroupScreen(),
    ExamNotesScreen(),
    Center(child: Text("Assessments")),
    StudentProfileScreen()
  ];

  final List<String> _titles = [
    "Modules",
    "Groups and sections",
    "Exam Notes",
    "Assessments",
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Modules",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Groups",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "Assessments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
