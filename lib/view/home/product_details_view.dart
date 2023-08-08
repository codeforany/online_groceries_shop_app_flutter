import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../model/offer_product_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_detail_view_model.dart';

class ProductDetails extends StatefulWidget {
  final OfferProductModel pObj;
  const ProductDetails({super.key, required this.pObj});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductDetailViewMode detailVM;

  @override
  void initState() {
    super.initState();
    detailVM = Get.put(ProductDetailViewMode(widget.pObj));
  }

  @override
  void dispose() {
    Get.delete<ProductDetailViewMode>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.maxFinite,
                  height: media.width * 0.8,
                  decoration: BoxDecoration(
                      color: const Color(0xffF2F3F2),
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: detailVM.pObj.image ?? "",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: media.width * 0.8,
                  ),
                ),
                SafeArea(
                  child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
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
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              "assets/img/share.png",
                              width: 20,
                              height: 20,
                            )),
                      ]),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          detailVM.pObj.name ?? "",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            detailVM.serviceCallAddRemoveFavorite();
                          },
                          icon: Image.asset(
                            detailVM.isFav.value
                                ? "assets/img/favorite.png"
                                : "assets/img/fav.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${detailVM.pObj.unitValue ?? ""}${detailVM.pObj.unitName ?? ""}, Price",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          detailVM.addSubQTY(isAdd: false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/img/subtack.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: TColor.placeholder.withOpacity(0.5),
                              width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Obx(() => Text(
                              detailVM.qty.value.toString(),
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          detailVM.addSubQTY(isAdd: true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/img/add_green.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          "\$${detailVM.getPrice()}",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Product Detail",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                            onPressed: () {
                              detailVM.showDetail();
                            },
                            icon: Image.asset(
                              detailVM.isShowDetail.value
                                  ? "assets/img/detail_open.png"
                                  : "assets/img/next.png",
                              width: 15,
                              height: 15,
                              color: TColor.primaryText,
                            )),
                      ),
                    ],
                  ),
                  Obx(() => detailVM.isShowDetail.value
                      ? Text(
                          detailVM.pObj.detail ?? "",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      : Container()),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nutritions",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: TColor.placeholder.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          detailVM.pObj.nutritionWeight ?? "100gr",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 9,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            detailVM.showNutrition();
                          },
                          icon: Image.asset(
                            detailVM.isShowNutrition.value
                                ? "assets/img/detail_open.png"
                                : "assets/img/next.png",
                            width: 15,
                            height: 15,
                            color: TColor.primaryText,
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(() => detailVM.isShowNutrition.value
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var nObj = detailVM.nutritionList[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nObj.nutritionName ?? "",
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  nObj.nutritionValue ?? "",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.black12,
                              ),
                          itemCount: detailVM.nutritionList.length)
                      : Container()),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Review",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/img/next.png",
                            width: 15,
                            height: 15,
                            color: TColor.primaryText,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RoundButton(
                    title: "Add To Basket",
                    onPressed: () {
                      CartViewModel.serviceCallAddToCart(
                          widget.pObj.prodId ?? 0, detailVM.qty.value , () {
                            Navigator.pop(context);
                          });
                    },
                  ),
                ],
              ),
            )
            // Text(
            //   "Loging",
            //   style: TextStyle(
            //       color: TColor.primaryText,
            //       fontSize: 26,
            //       fontWeight: FontWeight.w600),
            // ),
            // SizedBox(
            //   height: media.width * 0.03,
            // ),
            // Text(
            //   "Enter your emails and password",
            //   style: TextStyle(
            //       color: TColor.secondaryText,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w500),
            // ),
            // SizedBox(
            //   height: media.width * 0.1,
            // ),
          ],
        ),
      ),
    );
  }
}
