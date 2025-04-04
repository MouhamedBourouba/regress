import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/ui/providers/user_provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
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
          provider.errorMessage ?? "Unknown error please try again later",
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

    return DefaultTabController(
      length: min(provider.studentGroups!.length, 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: [
              Tab(child: Text(provider.studentGroups!.first.period)),
              if (provider.studentGroups!.length > 1)
                Tab(child: Text(provider.studentGroups![1].period))
            ],
          ),
          Expanded(
            child: TabBarView(
              children: provider.studentGroups!
                  .take(2)
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: _buildGroup(e),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildGroup(Group group) {
    return Card(
      elevation: 6,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Section",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.grey.shade700),
                ),
                Text(
                  group.section,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Group",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.grey.shade700),
                ),
                Text(
                  group.number,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
