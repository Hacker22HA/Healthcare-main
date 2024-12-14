import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentList {
  String id;
  String patientName;
  String date;
  String time;
  String imageUrl;

  AppointmentList({
    required this.id,
    required this.patientName,
    required this.date,
    required this.time,
    required this.imageUrl,
  });

  factory AppointmentList.fromFirestore(
      DocumentSnapshot doc, String patientName) {
    final data = doc.data() as Map<String, dynamic>;
    return AppointmentList(
      id: doc.id,
      patientName: patientName,
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
