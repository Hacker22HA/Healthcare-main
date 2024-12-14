import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class Hospitals_Doctor_Page extends StatelessWidget {
  Hospitals_Doctor_Page({super.key});

  final List<Map<String, String>> facilities = [
    {'title': "Jordan Hospital", 'subtitle': "Swefieh", 'type': "hospital"},
    {'title': "University Hospital", 'subtitle': "Zarqa", 'type': "hospital"},
    {'title': "Specialized Hospital", 'subtitle': "Irbid", 'type': "clinic"},
    {'title': "City Clinic", 'subtitle': "Amman", 'type': "clinic"},
  ];

  Widget getIcon(String type) {
    return type == 'hospital'
        ? Image.asset('assets/hospital.png', fit: BoxFit.cover)
        : Image.asset('assets/clinic.png', fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Hospitals",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: facilities.length,
          itemBuilder: (context, index) {
            final facility = facilities[index];
            return Column(
              children: [
                hospitalCard(
                  context,
                  title: facility['title']!,
                  subtitle: facility['subtitle']!,
                  type: facility['type']!,
                  onTap: () {
                    Get.toNamed("/FacilityDetailScreen");
                  },
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget hospitalCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String type,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: getIcon(type),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
