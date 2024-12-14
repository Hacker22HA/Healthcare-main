import 'package:cloud_firestore/cloud_firestore.dart';

class Hospital {
  final String name;
  final String location;
  final String routeName;

  Hospital({
    required this.name,
    required this.location,
    required this.routeName,
  });

  factory Hospital.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Hospital(
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      routeName: data['routeName'] ?? '',
    );
  }
}
