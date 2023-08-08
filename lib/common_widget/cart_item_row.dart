import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/common/color_extension.dart';

import '../model/cart_item_model.dart';

class CartItemRow extends StatelessWidget {
  final CartItemModel cObj;
  final VoidCallback didDelete;
  final VoidCallback didQtyAdd;
  final VoidCallback didQtySub;
  

  const CartItemRow({super.key, required this.cObj, required this.didQtyAdd, required this.didQtySub, required this.didDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 CachedNetworkImage(
                  imageUrl: cObj.image ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                 width: 80,
                  height: 65,
                  fit: BoxFit.contain,
                ),
                
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                cObj.name ?? "",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            InkWell(
                              onTap: didDelete,
                              child: Image.asset(
                                "assets/img/close.png",
                                width: 15,
                                height: 15,
                                color: TColor.secondaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                         "${cObj.unitValue}${cObj.unitName} Price",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: didQtySub,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          TColor.placeholder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/img/subtack.png",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              (cObj.qty ?? 0 ).toString(),
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: didQtyAdd,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          TColor.placeholder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/img/add_green.png",
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "\$${ (cObj.totalPrice ?? 0).toStringAsFixed(2) }",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
