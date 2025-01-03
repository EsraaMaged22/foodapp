
import 'package:flutter/material.dart';
import 'package:food_delivery/core/widgets/search_widget.dart';
import 'package:food_delivery/features/home/widgets/categories.dart';
import 'package:food_delivery/features/home/widgets/items_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/itemmodel.dart';
import '../profile/profileScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<ItemModel> allItems = [...burger, ...pizza, ...meals];
  List<ItemModel> displayedItems = [...burger, ...pizza, ...meals];

  void updateCategory(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          allItems = [...burger, ...pizza, ...meals];
          break;
        case 1:
          allItems = burger;
          break;
        case 2:
          allItems = meals;
          break;
        case 3:
          allItems = pizza;
          break;
        default:
          allItems = [];
      }
      displayedItems = allItems;
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedItems = allItems;
      } else {
        displayedItems = allItems.where((item) {
          return item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.description.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Foodgo",
                            style: GoogleFonts.lobster(
                              fontSize: 35,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "Order your favourite food!",
                            style: TextStyle(color: Color(0xff6a6a6a)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SearchWidget(
                    onSearch: _handleSearch,
                  ),
                ),
                CategoryBar(
                  selectedIndex: _selectedIndex,
                  onCategorySelected: updateCategory,
                ),
                GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: displayedItems
                      .map(
                        (product) => ItemsView(
                      item: product,
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
