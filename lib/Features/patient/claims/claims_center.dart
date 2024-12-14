import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class ClaimCenter extends StatelessWidget {
  const ClaimCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Claim Center',
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Active Claims'),
              Tab(text: 'Accepted Claims'),
              Tab(text: 'Denied Claims'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ClaimsList(claimStatus: 'Active'),
            ClaimsList(claimStatus: 'Accepted'),
            ClaimsList(claimStatus: 'Denied'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add functionality for adding a new claim
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class ClaimsList extends StatelessWidget {
  final String claimStatus;

  const ClaimsList({super.key, required this.claimStatus});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> claims = List.generate(9, (index) {
      return {
        'id': 'CLM${1000 + index}',
        'date': '2024-10-${index + 1 < 10 ? '0${index + 1}' : index + 1}',
        'amount': '\$${(100 + index * 50)}',
        'hospital': 'Hospital ${index + 1}',
        'doctor': 'Dr. ${[
          'Smith',
          'Johnson',
          'Lee',
          'Brown',
          'Wilson',
          'Taylor',
          'Clark',
          'Davis',
          'White'
        ][index]}'
      };
    });

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: claims.map((claim) => _buildClaimCard(claim)).toList(),
        ),
      ),
    );
  }

  Widget _buildClaimCard(Map<String, String> claim) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6.0,
      shadowColor: Colors.blue.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Claim ID: ${claim['id']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${claim['date']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Amount: ${claim['amount']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Hospital: ${claim['hospital']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Doctor: ${claim['doctor']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                claimStatus == 'Active'
                    ? Icons.timelapse
                    : claimStatus == 'Accepted'
                        ? Icons.check_circle
                        : Icons.cancel,
                color: claimStatus == 'Active'
                    ? Colors.orange
                    : claimStatus == 'Accepted'
                        ? Colors.green
                        : Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
