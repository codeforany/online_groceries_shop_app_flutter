import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/common/service_call.dart';
import '../model/promo_code_model.dart';

class PromoCodeViewModel extends GetxController {
  final RxList<PromoCodeModel> listArr = <PromoCodeModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("PromoCodeViewModel Init ");
    }

    serviceCalList();
  }

  //ServiceCall
  void serviceCalList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svPromoCodeList, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return PromoCodeModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }
}
