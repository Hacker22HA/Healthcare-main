import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final double imageSize;
  final double fontSize;
  final Function(Map<String, dynamic>) onTap;

  const CustomGrid({
    Key? key,
    required this.items,
    this.imageSize = 50.0,
    this.fontSize = 14.0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            for (int row = 0; row < (items.length / 3).ceil(); row++) ...[
              if (row > 0) const Divider(color: Colors.grey, thickness: 1),
              Row(
                children: [
                  for (int col = 0; col < 3; col++) ...[
                    if (col > 0)
                      Container(
                        width: 1,
                        color: Colors.grey[300],
                        height: 80,
                      ),
                    Expanded(
                      child: (row * 3 + col < items.length)
                          ? InkWell(
                              onTap: () => onTap(items[row * 3 + col]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: imageSize,
                                    width: imageSize,
                                    child: Image.asset(
                                      items[row * 3 + col]['image'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    items[row * 3 + col]['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: fontSize,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
