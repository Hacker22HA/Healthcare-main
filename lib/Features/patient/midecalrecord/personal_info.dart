import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

Widget _buildSection({
  required String title,
  required Color borderColor,
  required IconData icon,
  required Widget content,
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: borderColor, width: 2.0),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: borderColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: borderColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        content,
      ],
    ),
  );
}

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Personal Information'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            _buildSection(
              title: 'Chronic Conditions',
              borderColor: Colors.orange,
              icon: Icons.health_and_safety,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Asthma: Diagnosed 2015'),
                  Text('Diabetes: Diagnosed 2020'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: 'Surgeries',
              borderColor: Colors.red,
              icon: Icons.local_hospital,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Appendectomy'),
                  Text('  Date: 12 Feb 2022'),
                  Text('  Surgeon: Dr. John Doe'),
                  SizedBox(height: 8),
                  Text('Gallbladder Removal'),
                  Text('  Date: 5 Jun 2016'),
                  Text('  Surgeon: Dr. Emily Smith'),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
