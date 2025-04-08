import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/generated/json/student_data_entity.g.dart';
import 'package:regress/ui/providers/user_provider.dart';

class ExamNotesScreen extends StatelessWidget {
  const ExamNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    if (provider.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (!provider.loading && provider.studentGroups == null) {
      return Center(
        child: Text(
          provider.error ?? "Unknown error please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else if (provider.studentGroups!.isEmpty) {
      return Center(
        child: Text(
          "No Data available please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    return ListView.builder(
      itemCount: provider.studentNotes!.length,
      itemBuilder: (_, semester) {
        return ExpansionTile(
          initiallyExpanded: semester == 0,
          title: Text("Semester ${provider.studentNotes!.length - semester}"),
          children: [
            Table(
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              border: TableBorder.symmetric(inside: BorderSide.none, outside: BorderSide.none),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Subject",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Power",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Note",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                ...provider.studentNotes![provider.studentNotes!.length - (semester+1)].map(
                  (e) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(e.subject),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          e.coefficient.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          e.grade.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: e.grade >= 10 ? Colors.green : Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
