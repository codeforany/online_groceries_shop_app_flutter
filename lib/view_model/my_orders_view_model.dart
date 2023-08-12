import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../common/globs.dart';
import '../common/service_call.dart';
import '../model/my_order_model.dart';

class MyOrdersViewModel extends GetxController {
 
  final RxList<MyOrderModel> listArr = <MyOrderModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("MyOrdersViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svMyOrders, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return MyOrderModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  
}
