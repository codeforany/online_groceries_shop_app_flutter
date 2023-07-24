import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class AccountRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const AccountRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
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
