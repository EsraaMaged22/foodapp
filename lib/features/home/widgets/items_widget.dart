import 'package:flutter/material.dart';

import '../../../core/costants/fonts.dart';
import '../../../core/itemmodel.dart';
import 'itemdetails.dart';

class ItemsView extends StatefulWidget {
  final ItemModel item;

  const ItemsView({
    super.key,
    required this.item,
  });

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsView(
              item: widget.item,
            ),
          ),
        );
      },
      child: Container(
        decoration:   BoxDecoration(   border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        )
          ,boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2,

          ),

        ],

          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image(
              height: screenSize.height * .15,
              image: AssetImage(widget.item.image),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.textStyle16black,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(Icons.favorite),
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
