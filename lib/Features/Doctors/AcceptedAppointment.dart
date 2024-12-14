import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcceptedAppointmentScreen extends StatelessWidget {
  final String appointmentId;
  final Map<String, dynamic> data;

  const AcceptedAppointmentScreen({
    Key? key,
    required this.appointmentId,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appointment ID: $appointmentId',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Text('Date: ${data['date']}',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text('Time: ${data['time']}',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateStatus('confirmed', context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Confirm'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _deleteAppointment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateStatus(String status, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('accept_appointment')
          .doc(appointmentId)
          .update({'status': status});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Status updated to $status')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update status: $e')),
      );
    }
  }

  Future<void> _deleteAppointment(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('accept_appointment')
          .doc(appointmentId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment rejected and deleted')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to reject appointment: $e')),
      );
    }
  }
}
