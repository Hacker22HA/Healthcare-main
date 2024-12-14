import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_button.dart';

class Claims extends StatelessWidget {
  const Claims({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Claims Policy'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 1.5,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  SizedBox(height: 10),
                  Text(
                    "Terms and Conditions for Claims",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "1. Introduction",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This policy outlines the terms and conditions for submitting and processing claims. By submitting a claim, you agree to abide by these terms.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "2. Eligibility for Claims",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Claims are only eligible if the incident is covered under the policy. Claims for excluded items or services will be denied.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "3. Claim Submission Process",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "All claims must be submitted within 30 days of the incident. Late submissions may not be eligible for processing. Ensure that all necessary documents are provided, including proof of incident and any relevant receipts.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "4. Documentation Requirements",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "The following documents are required to process a claim: incident report, medical records, and receipts for any related expenses. Failure to provide these documents may result in a delay or denial of the claim.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "5. Claim Review and Processing",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Claims are reviewed within 15 business days. During this period, additional information may be requested. The outcome of the claim review will be communicated via email.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "6. Appeal Process for Denied Claims",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "If a claim is denied, you have the right to appeal within 14 days of receiving the decision. Appeals should include additional documentation supporting your case.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "7. Limitation of Liability",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We are not liable for any indirect damages resulting from the denial or delay in claim processing. Our responsibility is limited to processing claims as per the terms outlined in this policy.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "8. Policy Updates",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This policy may be updated periodically. It is the user's responsibility to review these terms regularly. Continued use of the claim service after updates indicates acceptance of the revised terms.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      "Thank you for trusting our claims process.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton( 
            text: "I Agree",
            onPressed: ()=> Get.toNamed("/claimcenter"),
          ),
        ),
          ],
        ),
      ),
     
      
    );
  }
}

