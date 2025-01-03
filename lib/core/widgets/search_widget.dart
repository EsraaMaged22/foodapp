import 'package:flutter/material.dart';
import '../costants/fonts.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onSearch; // Callback to handle search input

  const SearchWidget({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppFonts.textStyle16black,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
