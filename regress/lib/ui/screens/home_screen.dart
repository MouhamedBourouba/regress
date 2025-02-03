import 'package:flutter/material.dart';
import 'package:regress/app/di.dart';
import 'package:regress/domain/repository/user_data_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Portal"),
        actions: [
          FutureBuilder(
            future: gt.get<UserRepository>().getUserImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Image.file(snapshot.data!.getOrThrow());
              }
            },
          )
        ],
      ),
    );
  }
}
