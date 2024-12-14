import 'package:flutter/material.dart';
import 'package:new_healthapp/model/icon_items.dart';
import 'package:new_healthapp/screens/settings_screen.dart';
import 'package:new_healthapp/widgets/mainWidget/navigation_bar.dart';
import 'package:new_healthapp/widgets/patientWidget/Activemidication.dart';
import 'package:new_healthapp/widgets/mainWidget/costum_container.dart';
import 'package:new_healthapp/widgets/mainWidget/icon_containar.dart';
import 'package:new_healthapp/widgets/patientWidget/infowidget.dart';

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    HomeSection(),
    SearchSection(),
    FavoritesSection(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _sections[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            custom_containar(),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 150),
              child: CustomGrid(
                items: PatintItems,
                imageSize: 50.0,
                fontSize: 14.0,
                onTap: (item) {
                  if (item['route'] != null && item['route']!.isNotEmpty) {
                    Navigator.pushNamed(context, item['route']);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item['title']} clicked!')),
                    );
                  }
                },
              ),
            ),
          ]),
          const Info_widgets(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ActiveMedicinesWidget(),
          ),
        ],
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search Section',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FavoritesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Favorites Section',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
