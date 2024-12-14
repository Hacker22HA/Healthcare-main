import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/core/doctor_controller.dart';


class DoctorListPage extends StatelessWidget {
  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 3 of 4: Choose Doctor'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.doctors.isEmpty) {
          return Center(child: Text('No doctors available.'));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            final doctor = controller.doctors[index];
            return DoctorCard(
              name: doctor.name,
              specialty: doctor.specialty,
              imageUrl: doctor.imageUrl,
            );
          },
        );
      }),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const DoctorCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(imageUrl, width: 60.0, height: 60.0),
            title: Text(name),
            subtitle: Text(specialty),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to profile page if needed
                  },
                  child: Text('View Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/DateTimePage");
                  },
                  child: Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
