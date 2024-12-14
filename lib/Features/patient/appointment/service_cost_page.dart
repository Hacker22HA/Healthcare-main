import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class ServiceCostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service Cost Estimation',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Details',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ServiceDetailRow(label: 'Doctor\'s Fee', amount: 'JOD 50'),
              ServiceDetailRow(label: 'Service Charge', amount: 'JOD 30'),
              Divider(thickness: 1.0),
              ServiceDetailRow(
                label: 'Total Amount',
                amount: 'JOD 80',
                isBold: true,
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                   Get.toNamed("/ConfirmAppointmentPage");
                  },
                  child: Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  const ServiceDetailRow({
    required this.label,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
