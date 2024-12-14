import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/model/Midication_list.dart';

class MedicationService {
  final CollectionReference _medicationCollection =
      FirebaseFirestore.instance.collection('Medicines_List');

  Future<List<Medication>> getMedications() async {
    try {
      QuerySnapshot snapshot = await _medicationCollection.get();
      return snapshot.docs.map((doc) => Medication.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Error fetching medications: $e');
    }
  }
}
