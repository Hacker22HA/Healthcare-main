import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Settings',
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListTile(
              context,
              icon: Icons.info,
              title: 'About Us',
              onTap: () {
                Get.toNamed("/AboutUsScreen");
              },
            ),
            _buildListTile(
              context,
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () {
                Get.toNamed("/PrivacyPolicyScreen");
              },
            ),
            _buildListTile(
              context,
              icon: Icons.article,
              title: 'Terms of Service',
              onTap: () {
                Get.toNamed("/TermsOfServiceScreen");
              },
            ),
            SwitchListTile(
              value: true,
              onChanged: (bool value) {},
              title: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.orange),
                  SizedBox(width: 16),
                  Text('Notifications'),
                ],
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {
                Get.toNamed("/HelpSupportScreen");
              },
            ),
            _buildListTile(
              context,
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () async {
                bool confirm = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Sign Out"),
                      content: Text("Are you sure you want to sign out?"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          child: Text("Sign Out"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
                if (confirm) {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Get.offAllNamed("/");
                  } catch (e) {
                    Get.snackbar(
                        'Error', 'Failed to sign out. Please try again.',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
