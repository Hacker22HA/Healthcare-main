import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';
import 'package:new_healthapp/widgets/patientWidget/CustomCard.dart';

class MidecalRecord extends StatelessWidget {
  const MidecalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Medical Record'),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/personalinfo.png',
            title: 'Personal Information',
            subtitle: 'View chronic conditions, surgeries, and other details',
            routeName: "/personalinfo",
          ),
          CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/history.png',
            title: 'History',
            subtitle: 'Review past medical history',
            routeName: "/history",
          ),
          CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/labreports.png',
            title: 'Lab Reports',
            subtitle: 'Access lab test results',
            routeName: "/labreports",
          ),
          CustomCardBuilder.buildCard(
            context: context,
            imagePath: 'assets/images/radiology.png',
            title: 'Radiology',
            subtitle: 'Check radiology images and reports',
            routeName: "/radolgyreport",
          ),
        ],
      ),
    );
  }
}
