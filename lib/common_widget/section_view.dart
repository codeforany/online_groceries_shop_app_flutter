import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SectionView extends StatelessWidget {
  final String title;
  final bool isShowSeeAllButton;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  const SectionView(
      {super.key,
      required this.title,
      this.isShowSeeAllButton = true,
      this.padding,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "See All",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
