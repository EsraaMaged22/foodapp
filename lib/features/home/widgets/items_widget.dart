import 'package:flutter/material.dart';

import '../../../core/costants/fonts.dart';
import '../../../core/itemmodel.dart';
import 'itemdetails.dart';

class ItemsView extends StatelessWidget {
   final ItemModel item;

   const ItemsView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsView(
              item: item
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image(
              height: screenSize.height * .15,
              image: AssetImage(item.image), // Use AssetImage
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item.title,
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
                      onPressed: () async {

                      },
                     icon: Icon(Icons.favorite_border),
                      color:Colors.grey,
                    )


              ],
            ),
          ],
        ),
      ),
    );
  }
}

