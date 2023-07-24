import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/common_widget/round_button.dart';
import 'package:online_groceries/view/my_cart/order_accpet_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/checkout_row.dart';
import 'error_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Checkout",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/img/close.png",
                    width: 15,
                    height: 15,
                    color: TColor.primaryText,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black26,
            height: 1,
          ),
          CheckoutRow(
            title: "Delivery",
            value: "Select Method",
            onPressed: () {},
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      "Payment",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/img/master.png",
                      width: 30,
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
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
            ],
          ),
          CheckoutRow(
            title: "Promo Code",
            value: "Pick discount",
            onPressed: () {},
          ),
          CheckoutRow(
            title: "Total Cost",
            value: "\$10.96",
            onPressed: () {
              
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ErrorView() ,
                    ) ;
                  });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                children: [
                  const TextSpan(text: "By continuing you agree to our"),
                  TextSpan(
                      text: "Terms",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Terms of Service Click");
                        }),
                  const TextSpan(text: " and "),
                  TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Privacy Policy Click");
                        })
                ],
              ),
            ),
          ),
          RoundButton(
              title: "Place Order",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderAcceptView()));
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
