import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:new_healthapp/widgets/Balance.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoContainer({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class InfoDoctorScreen extends StatefulWidget {
  const InfoDoctorScreen({super.key});

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<InfoDoctorScreen> {
  // Doctor's information as variables
  String doctorName = "";
  String doctorID = "";
  String gender = "";
  String dateOfBirth = "";
  String specialization = "";
  String yearsOfExperience = "";
  String contactNumber = "";
  String email = "";
  String languagesSpoken = "";
  String medicalSchool = "";
  String residency = "";
  String boardCertification = "";
  String specialtyCertification = "";
  String? topDoctorAward = "";
  String? researchPublications = "";

  double availableBalance = 0;
  double targetBalance = 30000;
  int totalVisits = 0;
  int visitsThisYear = 0;
  int targetVisitsThisYear = 200;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchDoctorDataFromFirebase();
  }

  Future<void> fetchDoctorDataFromFirebase() async {
    try {
      final DocumentSnapshot doctorDoc = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(
              "doctor1") // Replace 'doctor_id' with the actual ID of the document you want to fetch.
          .get();

      if (doctorDoc.exists) {
        final data = doctorDoc.data() as Map<String, dynamic>;
        setState(() {
          doctorName = data['doctorName'] ?? "";
          doctorID = data['doctorID'] ?? "";
          gender = data['gender'] ?? "";
          dateOfBirth = data['dateOfBirth'] ?? "";
          specialization = data['specialization'] ?? "";
          yearsOfExperience = data['yearsOfExperience'] ?? "";
          contactNumber = data['contactNumber'] ?? "";
          email = data['email'] ?? "";
          languagesSpoken = data['languagesSpoken'] ?? "";
          medicalSchool = data['medicalSchool'] ?? "";
          residency = data['residency'] ?? "";
          boardCertification = data['boardCertification'] ?? "";
          specialtyCertification = data['specialtyCertification'] ?? "";
          topDoctorAward = data['topDoctorAward'];
          researchPublications = data['researchPublications'];
          availableBalance = data['availableBalance']?.toDouble() ?? 0;
          totalVisits = data['totalVisits'] ?? 0;
          visitsThisYear = data['visitsThisYear'] ?? 0;
        });
      }
    } catch (e) {
      print("Error fetching doctor data: $e");
    }
  }

  void openEditDialog() {
    // Set initial values for the controllers
    emailController.text = email;
    phoneController.text = contactNumber;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Information"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    final phoneRegex = RegExp(r'^\+962\d{9}\$');
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Phone number must start with +962 and contain 9 digits';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    email = emailController.text;
                    contactNumber = phoneController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double balancePercentage = (availableBalance / targetBalance) * 100;
    balancePercentage = balancePercentage > 100 ? 100 : balancePercentage;
    double overTarget =
        availableBalance > targetBalance ? availableBalance - targetBalance : 0;
    double visitsThisYearPercentage =
        (visitsThisYear / targetVisitsThisYear) * 100;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Doctor's Portal",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            InfoContainer(
              title: 'Earnings Target',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: BalanceMeter(balance: balancePercentage),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Text(
                            "Achieved Balance: \${availableBalance.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Target Balance: \${targetBalance.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          if (overTarget > 0)
                            Text(
                              "Over Target: \${overTarget.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InfoContainer(
              title: 'Visit Target',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Visits This Year: $visitsThisYear",
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Target: $targetVisitsThisYear",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: visitsThisYearPercentage / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
                const SizedBox(height: 5),
                Text(
                  "${visitsThisYearPercentage.toStringAsFixed(2)}% of Target Achieved",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            InfoContainer(
              title: 'Personal Information',
              children: [
                Text("Name: $doctorName"),
                Text("ID: $doctorID"),
                Text("Gender: $gender"),
                Text("Date of Birth: $dateOfBirth"),
                Text("Specialization: $specialization"),
                Text("Years of Experience: $yearsOfExperience"),
                Text("Contact Number: $contactNumber"),
                Text("Email: $email"),
                Text("Languages Spoken: $languagesSpoken"),
                Text("Medical School: $medicalSchool"),
                Text("Residency: $residency"),
                Text("Board Certification: $boardCertification"),
                Text("Specialty Certification: $specialtyCertification"),
                if (topDoctorAward != null && topDoctorAward!.isNotEmpty)
                  Text("Top Doctor Award: $topDoctorAward"),
                if (researchPublications != null &&
                    researchPublications!.isNotEmpty)
                  Text("Research Publications: $researchPublications"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: openEditDialog,
              child: const Text("Edit Contact Information"),
            ),
          ],
        ),
      ),
    );
  }
}
