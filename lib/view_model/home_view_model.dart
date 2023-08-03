import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/common/service_call.dart';

import '../model/offer_product_model.dart';
import '../model/type_model.dart';

class HomeViewModel extends GetxController {

  final RxList<OfferProductModel> offerArr = <OfferProductModel>[].obs; 
  final RxList<OfferProductModel> bestSellingArr = <OfferProductModel>[].obs;
  final RxList<TypeModel> groceriesArr = <TypeModel>[].obs;
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("HomeViewModel Init ");
    }

    serviceCallHome();
   
  }

  //ServiceCall
  void serviceCallHome() {

    Globs.showHUD();
    ServiceCall.post({
      
    }, SVKey.svHome, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var payload = resObj[KKey.payload] as Map? ?? {};
        

        var offerDataArr =   (payload["offer_list"] as List? ?? []).map((oObj) {
            return OfferProductModel.fromJson(oObj);
        }).toList();

        offerArr.value = offerDataArr;

        var bestSellingDataArr = (payload["best_sell_list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        bestSellingArr.value = bestSellingDataArr;

         var typeDataArr =
            (payload["type_list"] as List? ?? []).map((oObj) {
          return TypeModel.fromJson(oObj);
        }).toList();

        groceriesArr.value = typeDataArr;

         var listDataArr =
            (payload["list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
       
      } else {}

      
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

}
