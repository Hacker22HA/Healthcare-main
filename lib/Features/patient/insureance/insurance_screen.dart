import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/widgets/insuranceWidget/infocard.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class InsuranceCenterScreen extends StatelessWidget {
  Future<Map<String, dynamic>> fetchPatientInsuranceData() async {
    try {
      String patientId = "patientid";
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('patient_insurance')
          .doc(patientId)
          .get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Insurance Center',
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchPatientInsuranceData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found."));
          } else {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InfoCard(
                      title: "Personal Information",
                      data: {
                        "First Name": data["first_name"] ?? "N/A",
                        "Middle Name": data["middle_name"] ?? "N/A",
                        "Last Name": data["last_name"] ?? "N/A",
                        "Date of Birth": data["date_of_birth"] ?? "N/A",
                        "Gender": data["gender"] ?? "N/A",
                        "Contact Email": data["contact_email"] ?? "N/A",
                        "Contact Phone": data["contact_phone"] ?? "N/A",
                        "Address": data["address"] ?? "N/A",
                      },
                    ),
                    const SizedBox(height: 20),
                    InfoCard(
                      title: "Insurance Information",
                      data: {
                        "Insurance Name": data["insurance_name"] ?? "N/A",
                        "Member ID": data["member_id"]?.toString() ?? "N/A",
                        "Family ID": data["family_id"]?.toString() ?? "N/A",
                        "Policy Number":
                            data["policy_number"]?.toString() ?? "N/A",
                        "Group Number":
                            data["group_number"]?.toString() ?? "N/A",
                        "Patient Co-pay": data["patient_copay"] ?? "N/A",
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
