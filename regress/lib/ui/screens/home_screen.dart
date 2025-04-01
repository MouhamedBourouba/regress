import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/providers/user_provider.dart';

class StudentWidget extends StatelessWidget {
  final Student student;

  const StudentWidget({super.key, required this.student});

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student data',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              buildInfoRow('Registration Number', student.registrationNumber),
              buildInfoRow('Last Name', student.lastName),
              buildInfoRow('First Name', student.firstName),
              buildInfoRow('Birth Date', student.birthDate),
              buildInfoRow('Birth Place', student.birthPlace),
              buildInfoRow('University Name', student.universityName),

              const SizedBox(height: 8),
              Text(
                'Major',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              buildInfoRow('Domain', student.major.domain),
              buildInfoRow('Sector', student.major.sector),
              buildInfoRow('Level', student.major.level),
            ],
          ),
        ),
      ),
    );
  }
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

  Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Warning'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Selector<UserProvider, bool>(
        builder: (context, loading, _) {
          if (loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (provider.studentImage != null)
                  CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      child: Image.file(
                        provider.studentImage!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                StudentWidget(student: provider.student!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final result = await _showLogoutConfirmationDialog(context);
                    if (result) {
                      authProvider.logout();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        selector: (_, provider) => provider.loading,
        shouldRebuild: (previous, next) => previous != next,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // context.read<UserProvider>().loadData();
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
