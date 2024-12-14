import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class FamilyMember extends StatelessWidget {
  const FamilyMember({super.key});

  Future<List<Map<String, dynamic>>> fetchFamilyMembers() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('family_members').get();

      return snapshot.docs.map((doc) {
        return {
          'name': doc['name'] ?? 'N/A',
          'relation': doc['relationship'] ?? 'N/A',
          'age': doc['age']?.toString() ?? 'N/A',
          'id': doc['memberId']?.toString() ?? 'N/A',
          'imagePath': doc['imagePath'] ?? '',
        };
      }).toList();
    } catch (e) {
      throw Exception("Error fetching family members: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Family Member'),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchFamilyMembers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No family members found."));
          } else {
            final familyMembers = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: familyMembers.length,
              itemBuilder: (context, index) {
                final member = familyMembers[index];
                return _buildCard(
                  name: member['name'],
                  relation: member['relation'],
                  age: member['age'],
                  id: member['id'],
                  imagePath: member['imagePath'],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildCard({
    required String name,
    required String relation,
    required String age,
    required String id,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: imagePath.isNotEmpty
                ? Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  )
                : Icon(Icons.person, size: 50),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Relationship: $relation'),
            Text('Age: $age'),
            Text('Member ID: $id'),
          ],
        ),
        isThreeLine: true,
        onTap: () {},
      ),
    );
  }
}
