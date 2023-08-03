import 'package:flutter/material.dart';
import 'package:online_groceries/common_widget/product_cell.dart';

import '../../common/color_extension.dart';
import '../../model/offer_product_model.dart';
import 'filter_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  List searchArr = [
    {
      "name": "Egg Chicken Red",
      "icon": "assets/img/egg_chicken_red.png",
      "qty": "4",
      "unit": "pcs, Price",
      "price": "\$1.99"
    },
    {
      "name": "Egg Chicken White",
      "icon": "assets/img/egg_chicken_white.png",
      "qty": "2",
      "unit": "pcs, Price",
      "price": "\$1.49"
    },
    {
      "name": "Egg Pasta",
      "icon": "assets/img/egg_pasta.png",
      "qty": "1",
      "unit": "kg, Price",
      "price": "\$3.99"
    },
    {
      "name": "Egg Noodles",
      "icon": "assets/img/egg_noodles.png",
      "qty": "1",
      "unit": "kg, Price",
      "price": "\$6.49"
    },
    {
      "name": "Mayonnais Eggless",
      "icon": "assets/img/mayinnars_eggless.png",
      "qty": "325",
      "unit": "ml, Price",
      "price": "\$2.99"
    },
    {
      "name": "Egg Noodles",
      "icon": "assets/img/egg_noodies_new.png",
      "qty": "2",
      "unit": "kg, Price",
      "price": "\$9.49"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterView()));
              },
              icon: Image.asset(
                "assets/img/filter_ic.png",
                width: 20,
                height: 20,
              )),
        ],
        title: Container(
              height: 52,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      txtSearch.text = "";
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {});
                    },
                    icon: Image.asset(
                      "assets/img/t_close.png",
                      width: 15,
                      height: 15,
                    ),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search Store",
                  hintStyle: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
      ),
      body:  GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: searchArr.length,
              itemBuilder: ((context, index) {
                var pObj = searchArr[index] as Map? ?? {};
                return ProductCell(
                  pObj: OfferProductModel.fromJson(
              {
                "offer_price": 2.49,
                "start_date": "2023-07-30T18:30:00.000Z",
                "end_date": "2023-08-29T18:30:00.000Z",
                "prod_id": 5,
                "cat_id": 1,
                "brand_id": 1,
                "type_id": 1,
                "name": "Organic Banana",
                "detail":
                    "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                "unit_name": "pcs",
                "unit_value": "7",
                "nutrition_weight": "200g",
                "price": 2.99,
                "image": "product/202307310947354735xuruflIucc.png",
                "cat_name": "Frash Fruits & Vegetable",
                "type_name": "Pulses"
              },
            ),
                  margin: 0,
                  weight: double.maxFinite,
                  onPressed: () {},
                  onCart: () {},
                );
              }),
            ),
         
    );
  }
}
