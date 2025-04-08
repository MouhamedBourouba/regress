import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/user_provider.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    if (provider.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (!provider.loading && provider.moduleCoefficients == null) {
      return Center(
        child: Text(
          provider.error ?? "Unknown error please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else if (provider.moduleCoefficients!.isEmpty) {
      return Center(
        child: Text(
          "No Data available please try again later",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    final modules = provider.moduleCoefficients!;
    
    return ListView.builder(
      itemCount: modules.length,
      itemBuilder: (context, index) {
        final module = modules[index];
        return Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  module.moduleNameFrench,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _buildCoefficientRow(
                  context,
                  'Continuous Assessment',
                  module.continuousAssessmentCoefficient,
                ),
                if (module.midtermExamCoefficient > 0)
                  _buildCoefficientRow(
                    context,
                    'Midterm Exam',
                    module.midtermExamCoefficient,
                  ),
                _buildCoefficientRow(
                  context,
                  'Final Exam',
                  module.finalExamCoefficient,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoefficientRow(BuildContext context, String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            '${(value * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
