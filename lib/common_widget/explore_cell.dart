import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/common/color_extension.dart';

import '../model/explore_category_model.dart';

class ExploreCell extends StatelessWidget {
  final ExploreCategoryModel pObj;
  final VoidCallback onPressed;

  const ExploreCell({super.key, required this.pObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        
        
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: pObj.color ?? TColor.primary , width: 1 ),
          color: (pObj.color ?? TColor.primary).withOpacity(0.25),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: pObj.image ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 120,
                  height: 90,
                  fit: BoxFit.contain,
                ),
                
                
                
              ],
            ),

           const Spacer(),

            Text(
              pObj.catName ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
