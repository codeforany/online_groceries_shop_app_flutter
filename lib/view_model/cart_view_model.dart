import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/common/service_call.dart';
import 'package:online_groceries/model/address_model.dart';
import 'package:online_groceries/model/payment_model.dart';

import '../model/cart_item_model.dart';
import '../model/promo_code_model.dart';
import '../view/my_cart/order_accpet_view.dart';

class CartViewModel extends GetxController {
  final RxList<CartItemModel> listArr = <CartItemModel>[].obs;
  final cartTotalPrice = "0.0".obs;
  final deliverPriceAmount = "0.0".obs;
  final discountAmount = "0.0".obs;
  final userPayPrice = "0.0".obs;
  final isLoading = false.obs;

  final deliverObj = AddressModel().obs;
  final paymentObj = PaymentModel().obs;
  final promoObj = PromoCodeModel().obs;
  final deliveryType = "1".obs;
  final paymentType = "1".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("CartViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({
      "promo_code_id": promoObj.value.promoCodeId?.toString() ?? "",
      "deliver_type": deliveryType.value
    }, SVKey.svCartList, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return CartItemModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
        cartTotalPrice.value = resObj["total"] as String? ?? "0.0";
        deliverPriceAmount.value =
            resObj["deliver_price_amount"] as String? ?? "0.0";
        discountAmount.value = resObj["discount_amount"] as String? ?? "0.0";
        userPayPrice.value = resObj["user_pay_price"] as String? ?? "0.0";
      } else {
        cartTotalPrice.value = resObj["total"] as String? ?? "0.0";
        deliverPriceAmount.value =
            resObj["deliver_price_amount"] as String? ?? "0.0";
        discountAmount.value = resObj["discount_amount"] as String? ?? "0.0";
        userPayPrice.value = resObj["user_pay_price"] as String? ?? "0.0";

        Get.snackbar(Globs.appName, resObj[KKey.message] as String? ?? "Fail");
      }
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallUpdateCart(CartItemModel cObj, int newQty) {
    Globs.showHUD();
    ServiceCall.post({
      "cart_id": (cObj.cartId ?? 0).toString(),
      "prod_id": (cObj.prodId ?? 0).toString(),
      "new_qty": newQty.toString()
    }, SVKey.svUpdateCart, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());
        serviceCallList();
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallRemoveCart(CartItemModel cObj) {
    Globs.showHUD();
    ServiceCall.post({
      "cart_id": (cObj.cartId ?? 0).toString(),
      "prod_id": (cObj.prodId ?? 0).toString(),
    }, SVKey.svRemoveCart, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();
      if (resObj[KKey.status] == "1") {
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());
        serviceCallList();
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallOrderPlace() {
    if (deliveryType.value == "1" && (deliverObj.value.addressId ?? 0) == 0) {
      Get.snackbar(Globs.appName, "Please select delivery address");
      return;
    }

    if (paymentType.value == "2" && (paymentObj.value.payId ?? 0) == 0) {
      Get.snackbar(Globs.appName, "Please select payment method");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "address_id": deliveryType.value == "2"
          ? ""
          : deliverObj.value.addressId?.toString() ?? "",
      "deliver_type": deliveryType.value,
      "payment_type": paymentType.value,
      "pay_id": paymentType.value == "1"
          ? ""
          : paymentObj.value.payId?.toString() ?? "",
      "promo_code_id": promoObj.value.promoCodeId?.toString() ?? ""
    }, SVKey.svOrderPlace, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();
      if (resObj[KKey.status] == "1") {
        Get.back();
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());

        await Future.delayed( const Duration(milliseconds: 100) );
        serviceCallList();
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(() => const OrderAcceptView());
        
      } else {
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());
      }
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  static void serviceCallAddToCart(int prodId, int qty, VoidCallback didDone) {
    Globs.showHUD();
    ServiceCall.post({
      "prod_id": prodId.toString(),
      "qty": qty.toString(),
    }, SVKey.svAddToCart, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();
      if (resObj[KKey.status] == "1") {
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());
        didDone();
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }
}
