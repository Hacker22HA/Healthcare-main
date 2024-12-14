import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/Features/patient/appointment/consultation_type_page.dart';

class ChooseFamilyMemberPage extends StatefulWidget {
  @override
  _ChooseFamilyMemberPageState createState() => _ChooseFamilyMemberPageState();
}

class _ChooseFamilyMemberPageState extends State<ChooseFamilyMemberPage> {
  Future<List<Map<String, dynamic>>> fetchFamilyMembers() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('family_members').get();

      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'name': doc['name'] ?? 'N/A',
          'relationship': doc['relationship'] ?? 'N/A',
          'age': doc['age'] ?? 'N/A',
        };
      }).toList();
    } catch (e) {
      throw Exception("Error fetching family members: $e");
    }
  }

  Map<String, dynamic>? selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Family Member'),
      ),
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
                final isSelected = selectedMember == member;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMember = member;
                    });
                  },
                  child: Card(
                    color: isSelected ? Colors.lightBlue[100] : null,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(member['name']),
                      subtitle: Text(
                          'Relationship: ${member['relationship']}\nAge: ${member['age']}'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: selectedMember == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultationTypePage(),
                    ),
                  );
                },
          child: const Text('Next: Select Visit Type'),
        ),
      ),
    );
  }
}
