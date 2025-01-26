import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final double buttonWidth;
  final double buttonHeight;

  const CategoryButtons({super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    this.buttonWidth = 150.0,
    this.buttonHeight = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: () => onCategorySelected('everything'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == 'everything' ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                ),
                side: BorderSide(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedCategory == 'everything')
                    Icon(Icons.check, color: Colors.white, size: 18),
                  SizedBox(width: selectedCategory == 'everything' ? 5 : 0),
                  Text(
                    'Everything',
                    style: TextStyle(
                      color: selectedCategory == 'everything' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 'Cars' button
          Container(
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: () => onCategorySelected('cars'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == 'cars' ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
                ),
                side: BorderSide(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedCategory == 'cars')
                    Icon(Icons.check, color: Colors.white, size: 18),
                  SizedBox(width: selectedCategory == 'cars' ? 5 : 0),
                  Text(
                    'Cars',
                    style: TextStyle(
                      color: selectedCategory == 'cars' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
