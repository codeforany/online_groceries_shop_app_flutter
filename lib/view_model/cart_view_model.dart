import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/common/service_call.dart';

import '../model/cart_item_model.dart';

class CartViewModel extends GetxController {
  final RxList<CartItemModel> listArr = <CartItemModel>[].obs;
  final cartTotalPrice = "0.0".obs;
  final isLoading = false.obs;

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
    ServiceCall.post({}, SVKey.svCartList, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return CartItemModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
        cartTotalPrice.value = resObj["total"] as String? ?? "0.0";
      } else {}
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
