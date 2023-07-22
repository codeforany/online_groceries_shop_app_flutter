import 'package:flutter/material.dart';
import 'package:online_groceries/view/explore/search_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/explore_cell.dart';
import 'explore_detail_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController txtSearch = TextEditingController();

  List findProductArr = [
    {
      "name": "Frash Fruits & Vegetable",
      "icon": "assets/img/frash_fruits.png",
      "color": const Color(0xff53B175),
    },
    {
      "name": "Cooking Oil & Ghee",
      "icon": "assets/img/cooking_oil.png",
      "color": const Color(0xffF8A44C),
    },
    {
      "name": "Meat & Fish",
      "icon": "assets/img/meat_fish.png",
      "color": const Color(0xffF7A593),
    },
    {
      "name": "Bakery & Snacks",
      "icon": "assets/img/bakery_snacks.png",
      "color": const Color(0xffD3B0E0),
    },
    {
      "name": "Dairy & Eggs",
      "icon": "assets/img/dairy_eggs.png",
      "color": const Color(0xFFFDE598),
    },
    {
      "name": "Beverages",
      "icon": "assets/img/beverages.png",
      "color": const Color(0xffB7DFF5),
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Find Products",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Image.asset(
                        "assets/img/search.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      "Search Store",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: findProductArr.length,
              itemBuilder: ((context, index) {
                var eObj = findProductArr[index] as Map? ?? {};
                return ExploreCell(
                  pObj: eObj,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExploreDetailView(
                                eObj: eObj,
                              )),
                    );
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
