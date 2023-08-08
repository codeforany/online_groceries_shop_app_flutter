import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/view/explore/search_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/explore_cell.dart';
import '../../view_model/explore_view_model.dart';
import 'explore_detail_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController txtSearch = TextEditingController();

  final exploreVM = Get.put(ExploreViewModel());

  @override
  void dispose() {
    Get.delete<ExploreViewModel>();
    super.dispose();
  }

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
            child: Obx(
              () => GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: exploreVM.listArr.length,
                itemBuilder: ((context, index) {
                  var eObj = exploreVM.listArr[index];
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
            ),
          )
        ],
      ),
    );
  }
}
