import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/user_provider.dart';

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Selector<UserProvider, bool>(
        builder: (context, loading, _) {
          if (loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipOval(
                        child: provider.studentImage == null
                            ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [
                                Colors.blue.shade200,
                                Colors.blue,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              provider.student!.firstName.substring(0, 1).toUpperCase() +
                                  provider.student!.lastName.substring(0, 1).toUpperCase(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        )
                            : Image.file(
                          provider.studentImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          provider.student!.firstName + provider.student!.lastName,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          provider.student!.universityName,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
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
