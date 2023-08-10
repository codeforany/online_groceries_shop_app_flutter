import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/globs.dart';
import '../common/service_call.dart';
import '../model/payment_model.dart';

class PaymentViewModel extends GetxController {
  final txtName = TextEditingController().obs;
  final txtCardNumber = TextEditingController().obs;
  final txtMonth = TextEditingController().obs;
  final txtYear = TextEditingController().obs;

  final RxList<PaymentModel> listArr = <PaymentModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("PaymentViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svPaymentMethodList, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        clearAll();
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return PaymentModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  

  void serviceCallRemove(PaymentModel pObj) {
    Globs.showHUD();
    ServiceCall.post({"pay_id": (pObj.payId ?? 0).toString()},
        SVKey.svRemovePaymentMethod, isToken: true,
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

  void setDataModel(PaymentModel pObj) {
    txtName.value.text = pObj.name ?? "";
    txtCardNumber.value.text = pObj.cardNumber ?? "";
    txtMonth.value.text = pObj.cardMonth ?? "";
    txtYear.value.text = pObj.cardYear ?? "";
   
  }

  void clearAll() {
    txtName.value.text = "";
    txtCardNumber.value.text = "";
    txtMonth.value.text = "";
    txtYear.value.text = "";
   
  }

  void serviceCallAdd(VoidCallback didDone) {
    if (txtName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter name");
      return;
    }

    

    if (txtCardNumber.value.text.length != 16) {
      Get.snackbar(Globs.appName, "Please enter valid card number");
      return;
    }
    if (txtMonth.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter card month");
      return;
    }

    if (txtYear.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter card year");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "name": txtName.value.text,
      "card_number": txtCardNumber.value.text,
      "card_month": txtMonth.value.text,
      "card_year": txtYear.value.text
      
    }, SVKey.svAddPaymentMethod, isToken: true, withSuccess: (resObj) async {
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
