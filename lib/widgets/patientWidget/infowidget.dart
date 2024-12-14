import 'package:flutter/material.dart';

class Info_widgets extends StatelessWidget {
  const Info_widgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100,left: 25,right: 25),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.grey[300]!, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Latest News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                        maxHeight: 30, maxWidth: 30),
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        "assets/images/info.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                SizedBox(width: 5,),
                  const Expanded(
                    child: Text(
                      "A new Health Insurance Application has launched in Jordan, be ready for a better health experience.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}