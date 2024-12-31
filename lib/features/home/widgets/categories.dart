import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costants/colors.dart';


class CategoryBar extends StatelessWidget {
  final int selectedIndex;

  const CategoryBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List <String> categories = [
       'All',
      'Burger',
    'Meals',
      'Pizza',
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container( margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox( height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                child: SizedBox( width: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container( width: 55,
                          decoration: BoxDecoration(
                            color: index == selectedIndex ? AppColors.primaryRed : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(categories[index], style: TextStyle(color: Colors.black)))),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}