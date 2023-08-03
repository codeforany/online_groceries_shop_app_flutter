import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/model/offer_product_model.dart';

import '../common/color_extension.dart';

class FavoriteRow extends StatelessWidget {
  final OfferProductModel pObj;
  final VoidCallback onPressed;

  const FavoriteRow(
      {super.key,
      required this.pObj,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: pObj.image ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                   width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),

                const SizedBox(
                  width: 15,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        pObj.name ?? "",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),

                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${pObj.unitValue}${pObj.unitName}",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),

                  ],) ,
                ),
                const SizedBox(
                  width: 8,
                ),

                Text(
                  "\$${pObj.offerPrice ?? pObj.price}",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/img/next.png",
                  height: 15,
                  color: TColor.primaryText,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
