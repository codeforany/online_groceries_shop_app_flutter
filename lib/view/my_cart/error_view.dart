import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.sizeOf(context);
    return Container(
      width: media.width * 0.9 ,
      
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/img/close.png",
                  width: 20,
                  height: 20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/img/order_fail.png",
            width: media.width * 0.5,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Oops! Order Failed",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Something went tembly wrong.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),

          const SizedBox(
            height: 40,
          ),
          RoundButton(title: "Please Try Again", onPressed: () {}),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back to home",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
