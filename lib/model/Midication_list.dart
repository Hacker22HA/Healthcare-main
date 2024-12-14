import 'package:cloud_firestore/cloud_firestore.dart';

class Medication {
  final String name;
  final String quantity;
  final String duration;
  final String status;
  final String nextRefill;
  final int refillsUsed;
  final String instruction;
  final String? note;
  final bool isRefillable;
  final String imagePath;

  Medication({
    required this.name,
    required this.quantity,
    required this.duration,
    required this.status,
    required this.nextRefill,
    required this.refillsUsed,
    required this.instruction,
    this.note,
    required this.isRefillable,
    required this.imagePath,
  });

  factory Medication.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Medication(
      name: data['name'] ?? '',
      quantity: data['quantity'] ?? '',
      duration: data['duration'] ?? '',
      status: data['status'] ?? 'Inactive',
      nextRefill: data['nextRefill'] ?? '',
      refillsUsed: data['refillsUsed'] ?? 0,
      instruction: data['instruction'] ?? '',
      note: data['note'],
      isRefillable: data['isRefillable'] ?? false,
      imagePath: data['imagePath'] ?? '',
    );
  }
}
