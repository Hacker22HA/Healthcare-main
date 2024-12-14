import 'package:flutter/material.dart';

class BalanceMeter extends StatelessWidget {
  final double balance;

  const BalanceMeter({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: balance / 100,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
        Text(
          "${balance.toStringAsFixed(1)}%",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}