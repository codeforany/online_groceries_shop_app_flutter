import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/favourite_row.dart';
import '../../view_model/favourite_view_model.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  final favVM = Get.find<FavoriteViewModel>();

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
              itemCount: favVM.listArr.length,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                var pObj = favVM.listArr[index];
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
