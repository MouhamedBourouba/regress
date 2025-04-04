import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:regress/ui/screens/login_screen.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({
    super.key,
  });

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Warning'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('no'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    if (provider.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (!provider.loading && provider.student == null) {
      return Center(
        child: Text(
          provider.errorMessage ?? "Unknown error please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    if (provider.loggedOut) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (provider.studentImage != null)
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.file(
                    provider.studentImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            _StudentWidget(student: provider.student!),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await _showLogoutConfirmationDialog(context);
                  if (result) {
                    await provider.logout();
        
                    if (!mounted) return;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "LOGOUT",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentWidget extends StatelessWidget {
  final Student student;

  const _StudentWidget({required this.student});

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
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General information",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const Divider(color: Colors.green),
              buildInfoRow('First Name', student.firstName),
              buildInfoRow('Last Name', student.lastName),
              buildInfoRow('University', student.universityName),
              buildInfoRow('Birth Date', student.birthDate),
              buildInfoRow('Birth Place', student.birthPlace),
              buildInfoRow('Registration Number', student.registrationNumber),
              const SizedBox(height: 8),
              Text(
                'Major',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const Divider(color: Colors.green),
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
