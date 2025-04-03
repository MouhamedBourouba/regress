import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:regress/utils/utils.dart';

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
    } else if (!provider.loading && provider.student == null) {
      return Center(
        child: Text(
          provider.errorMessage ?? "Unknown error please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    final gg = (provider.studentGroups!.length / 2).floor();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildYearDivider(1),
          Expanded(
            child: ListView.separated(
              itemCount: (provider.studentGroups!.length / 2).floor(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: _buildGroupCard(provider.studentGroups![index]),
                    ),
                    Expanded(
                      child: _buildGroupCard(provider.studentGroups![index + 1]),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return _buildYearDivider(index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildGroupCard(Group group) => Card(
        child: Column(
          children: [
            Text(group.period),
            Text(group.number),
            Text(group.section),
          ],
        ),
      );

  _buildYearDivider(int year) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${1.toOrdinal()} Year",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          Divider()
        ],
      );
}
