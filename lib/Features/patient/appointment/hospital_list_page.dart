import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/model/Hospital.dart';

class HospitalListScreen extends StatefulWidget {
  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  late Future<List<Hospital>> hospitals;

  @override
  void initState() {
    super.initState();
    hospitals = fetchHospitals();
  }

  Future<List<Hospital>> fetchHospitals() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Hospital')
        .orderBy('name')
        .get();

    return snapshot.docs.map((doc) => Hospital.fromFirestore(doc)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hospitals')),
      body: FutureBuilder<List<Hospital>>(
        future: hospitals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hospitals available.'));
          }

          var hospitals = snapshot.data!;

          return ListView.builder(
            itemCount: hospitals.length,
            itemBuilder: (context, index) {
              var hospital = hospitals[index];
              return Card(
                child: ListTile(
                  title: Text(hospital.name),
                  subtitle: Text(hospital.location),
                  onTap: () {
                    Get.toNamed(hospital.routeName);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
