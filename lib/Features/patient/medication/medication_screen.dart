
import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';
import 'package:new_healthapp/widgets/patientWidget/CustomCard.dart';

class Medication extends StatelessWidget {
  const Medication ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Medication'),

   body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/Medications.png',
            title: 'Active Medication',
            subtitle: 'View your current medications',
            routeName: "/medicen",
          ),
            const SizedBox(height: 16),
            CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/history.png',
            title: 'Refill Orders',
            subtitle: 'Review and manage refill orders',
            routeName: "/order",
          ),
          ],
        ),
      ),
    );
  }
}
 