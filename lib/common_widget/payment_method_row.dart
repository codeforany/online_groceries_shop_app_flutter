import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/view_model/payment_view_model.dart';

import '../common/color_extension.dart';
import '../model/payment_model.dart';

class PaymentMethodRow extends StatelessWidget {
  final PaymentModel pObj;
  final VoidCallback didUpdateDone;
  final VoidCallback onTap;
  const PaymentMethodRow(
      {super.key, required this.pObj, required this.didUpdateDone, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                      "assets/img/paymenth_methods.png",
                      width: 30,
                      height: 30,
                    ),
            ),
    
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pObj.name ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
    
                    const SizedBox(
                      height: 4,
                    ),
    
                    Text(
                      "**** **** **** ${pObj.cardNumber ?? ""}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    
                    
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.find<PaymentViewModel>().serviceCallRemove(pObj);
                },
                icon: Image.asset(
                  "assets/img/close.png",
                  width: 15,
                  height: 15,
                )),
          ],
        ),
      ),
    );
  }
}
