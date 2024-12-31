
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
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    List<ItemModel> displayedItems = items; // Assuming 'items' is defined elsewhere

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
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: SearchWidget(),
                ),
                CategoryBar(selectedIndex: _selectedIndex),
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
