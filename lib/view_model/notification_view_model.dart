import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../common/globs.dart';
import '../common/service_call.dart';
import '../model/notification_model.dart';

class NotificationViewModel extends GetxController {
 

  final RxList<NotificationModel> listArr = <NotificationModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("NotificationViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svNotificationList, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
       
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return NotificationModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  

  void serviceCallReadAll() {
    Globs.showHUD();
    ServiceCall.post({},
        SVKey.svNotificationReadAll, isToken: true,
        withSuccess: (resObj) async {
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

 
}
