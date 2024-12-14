import 'package:flutter/material.dart';
import 'package:new_healthapp/model/icon_items.dart';
import 'package:new_healthapp/screens/patient_screen.dart';
import 'package:new_healthapp/screens/settings_screen.dart';
import 'package:new_healthapp/widgets/mainWidget/costum_container.dart';
import 'package:new_healthapp/widgets/mainWidget/icon_containar.dart';
import 'package:new_healthapp/widgets/mainWidget/navigation_bar.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

int _currentIndex = 0;

final List<Widget> _sections = [
  HomeSection(),
  SearchSection(),
  FavoritesSection(),
  SettingsPage(),
];

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            custom_containar(),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 150),
              child: CustomGrid(
                items: DoctorsItems,
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
        ],
      ),
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
