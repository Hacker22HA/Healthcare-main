import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class LabReportsScreen extends StatefulWidget {
  const LabReportsScreen({super.key});

  @override
  _LabReportsScreenState createState() => _LabReportsScreenState();
}

class _LabReportsScreenState extends State<LabReportsScreen> {
  List<Map<String, dynamic>> labReports = [];
  final bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    fetchLabReports();
  }

  void fetchLabReports() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      labReports = [
        {
          "type": "Blood Test",
          "date": "22 October 2023",
          "findings": "Hemoglobin: 13.5 g/dL",
          "comments": "Levels are normal",
          "pdfUrl": "https://example.com/lab_report_1.pdf",
        },
        {
          "type": "Cholesterol Test",
          "date": "01 August 2023",
          "findings": "LDL: 120 mg/dL",
          "comments": "Slightly elevated",
          "pdfUrl": "https://example.com/lab_report_2.pdf",
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Lab Reports"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: labReports
                    .map((report) => _buildReportCard(report))
                    .toList(),
              ),
            ),
          ),
          if (_isDownloading)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Downloading PDF...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReportCard(Map<String, dynamic> report) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                report["type"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text("Date: ${report["date"]}", style: _textStyle()),
              Text("Findings: ${report["findings"]}", style: _textStyle()),
              Text("Comments: ${report["comments"]}", style: _textStyle()),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Download PDF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.black54,
    );
  }
}
