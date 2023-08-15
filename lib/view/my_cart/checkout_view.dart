import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/round_button.dart';
import 'package:online_groceries/view/account/address_list_view.dart';
import 'package:online_groceries/view/account/payment_method_view.dart';
import 'package:online_groceries/view/account/promo_code_view.dart';
import 'package:online_groceries/view_model/cart_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/checkout_row.dart';
import 'error_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final cartVM = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(
        () => Column(
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Delivery Type",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        CupertinoSegmentedControl(
                            children: const {
                              "1": Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Delivery")),
                              "2": Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Collection")),
                            },
                            selectedColor: TColor.primary,
                            groupValue: cartVM.deliveryType.value,
                            onValueChanged: (sObj) {
                              cartVM.deliveryType.value = sObj;
                            }),
                      ],
                    ),
                  
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ],
            ),
            if (cartVM.deliveryType.value == "1")
              CheckoutRow(
                title: "Delivery",
                value: (cartVM.deliverObj.value.name ?? "") != ""
                    ? (cartVM.deliverObj.value.name ?? "")
                    : "Select Method",
                onPressed: () {
                  Get.to(() => AddressListView(
                        didSelect: (aObj) {
                          cartVM.deliverObj.value = aObj;
                        },
                      ));
                },
              ),

              Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        "Payment Type",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      CupertinoSegmentedControl(
                          children: const {
                            "1": Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("COD")),
                            "2": Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Online")),
                          },
                          selectedColor: TColor.primary,
                          groupValue: cartVM.paymentType.value,
                          onValueChanged: (sObj) {
                            cartVM.paymentType.value = sObj;
                          }),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ],
            ),

            if (cartVM.paymentType.value == "2")
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => PaymentMethodListView(
                          didSelect: (pObj) {
                            cartVM.paymentObj.value = pObj;
                          },
                        ));
                  },
                  child: Padding(
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
                          width: 8,
                        ),
                        Text(
                          (cartVM.paymentObj.value.name ?? "") != ""
                              ? (cartVM.paymentObj.value.cardNumber ?? "")
                              : "Select",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
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
            ),
            CheckoutRow(
              title: "Promo Code",
              value: (cartVM.promoObj.value.code ?? "") != ""
                  ? (cartVM.promoObj.value.code ?? "")
                  : "Pick discount",
              onPressed: () {
                Get.to(() => PromoCodeView(
                      didSelect: (pObj) {
                        cartVM.promoObj.value = pObj;
                        cartVM.serviceCallList();
                      },
                    ));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            "\$ ${cartVM.cartTotalPrice.value}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Delivery Cost",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            "+ \$ ${cartVM.deliverPriceAmount.value}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Discount ",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            "- \$ ${cartVM.discountAmount.value}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CheckoutRow(
              title: "Final Total",
              value: "\$${cartVM.userPayPrice.value}",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.symmetric(horizontal: 20),
                        child: ErrorView(),
                      );
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
                  cartVM.serviceCallOrderPlace( );
                
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
