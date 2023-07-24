import 'package:flutter/material.dart';
import 'package:online_groceries/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/cart_item_row.dart';
import '../../common_widget/favourite_row.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List listArr = [
    {
      "name": "Sprite Can",
      "icon": "assets/img/sprite_can.png",
      "qty": "325",
      "unit": "ml, Price",
      "price": "\$1.49"
    },
    {
      "name": "Diet Coke",
      "icon": "assets/img/diet_coke.png",
      "qty": "355",
      "unit": "ml, Price",
      "price": "\$1.99"
    },
    {
      "name": "Apple & Grape Juice",
      "icon": "assets/img/juice_apple_grape.png",
      "qty": "2",
      "unit": "L, Price",
      "price": "\$15.99"
    },
    {
      "name": "Coca Cola Can",
      "icon": "assets/img/cocacola_can.png",
      "qty": "325",
      "unit": "ml, Price",
      "price": "\$4.99"
    },
    {
      "name": "Pepsi Can",
      "icon": "assets/img/pepsi_can.png",
      "qty": "325",
      "unit": "ml, Price",
      "price": "\$4.49"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemCount: listArr.length,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                var pObj = listArr[index] as Map? ?? {};
                return FavoriteRow(
                  pObj: pObj,
                  onPressed: (){

                  },
                );
              }),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                RoundButton(title: "Add All To Cart", onPressed: (){

                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
