import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costants/colors.dart';



class CategoryBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryBar({
    Key? key,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Burger',
      'Meals',
      'Pizza',
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onCategorySelected(index),
                child: SizedBox(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? AppColors.primaryRed
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
