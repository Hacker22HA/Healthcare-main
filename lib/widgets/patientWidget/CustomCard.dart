import 'package:flutter/material.dart';

class CustomCardBuilder {
  static Widget buildCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subtitle,
    required String routeName,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
