import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultationTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 1 of 4: Select Visit Type'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            ConsultationTypeCard(
                icon: Icons.local_hospital,
                label: 'Hospital',
                onTap: () {
                  Get.toNamed("/HospitalListScreen");
                }),
            ConsultationTypeCard(
              icon: Icons.computer,
              label: 'Online',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ConsultationTypeCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Colors.blue),
            SizedBox(height: 8.0),
            Text(label, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
