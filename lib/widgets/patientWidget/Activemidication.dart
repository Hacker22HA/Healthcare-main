import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActiveMedicinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Medicines',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(
            height: 150.0,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('medicines') // اسم المجموعة في Firestore
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No active medicines found.'));
                }

                final medicines = snapshot.data!.docs.map((doc) {
                  return Medicine.fromFirestore(doc);
                }).toList();

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medicines.length,
                  itemBuilder: (context, index) {
                    return MedicineCard(medicine: medicines[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            medicine.imageUrl,
            height: 60.0,
            width: 60.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            medicine.name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.0),
          Text(
            medicine.dosage,
            style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
          ),
          SizedBox(height: 4.0),
          Text(
            'End: ${medicine.endDate}',
            style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

class Medicine {
  final String name;
  final String dosage;
  final String endDate;
  final String imageUrl;

  Medicine({
    required this.name,
    required this.dosage,
    required this.endDate,
    required this.imageUrl,
  });

  // Factory method to create a Medicine object from Firestore data
  factory Medicine.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Medicine(
      name: data['name'] ?? 'Unknown',
      dosage: data['dosage'] ?? 'Unknown',
      endDate: data['endDate'] ?? 'Unknown',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
