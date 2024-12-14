import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class DateTimePage extends StatefulWidget {
  @override
  _DateTimePageState createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(), // Prevent selecting past dates
      lastDate: DateTime(2025, 12), // Limit future dates
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Validate selection before proceeding
  void _saveSelection() {
    // Combine selected date and time
    final selectedDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    // Check if selected datetime is in the future
    if (selectedDateTime.isAfter(DateTime.now())) {
      // Pass selected date and time to next page
      Get.toNamed("/ServiceCostPage", arguments: {
        'date': _selectedDate,
        'time': _selectedTime,
      });
    } else {
      // Show error if selected time is in the past
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a future date and time'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Date & Time',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Date Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate)}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Time Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected Time: ${_selectedTime.format(context)}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.access_time, color: Colors.blue),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              SizedBox(height: 32.0),

              // Save Button
              ElevatedButton(
                onPressed: _saveSelection,
                child: Text('Save Selection'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
