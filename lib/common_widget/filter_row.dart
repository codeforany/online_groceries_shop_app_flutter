import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class FilterRow extends StatelessWidget {
  final Map fObj;
  final bool isSelect;
  final VoidCallback onPressed;
  const FilterRow(
      {super.key,
      required this.fObj,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          Image.asset(
           isSelect ? "assets/img/checkbox_check.png" :  "assets/img/checkbox.png",
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              fObj["name"],
              style: TextStyle(
                  color: isSelect ? TColor.primary : TColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ]),
      ),
    );
  }
}
