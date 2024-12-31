import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/widgets/custombutton.dart';

import '../../../core/costants/fonts.dart';
import '../../../core/itemmodel.dart';

class ItemDetailsView extends StatelessWidget {
   ItemModel item;

  ItemDetailsView( {
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Image.asset(
                  item.image, // Use AssetImage
                  height: screenSize.height * .4,
                  width: double.infinity,
                ),
                SizedBox(height: screenSize.height * .05),
                Text(item.title, style: AppFonts.textStyle16black),
                SizedBox(height: screenSize.height * .01),
                Row( children: [ Icon(Icons.star,color: Colors.amberAccent,),SizedBox(width: 5,),
                  Text(item.rate.toString(), style: AppFonts.textStyle16gray)   ],),
                SizedBox(height: screenSize.height * .02),
                Text('Price :  \$${item.price}', style: AppFonts.textStyle16black),
                SizedBox(height: screenSize.height * .02),
                Text('Description', style: AppFonts.textStyle16black),
                SizedBox(height: screenSize.height * .01),
                Text(item.description, style: AppFonts.textStyle16gray),
             CustomButton(text: "Order now", onPressed: () {print("item ordered");}) ],
            ),
          ),
        ),
      ),
    );
  }
}
