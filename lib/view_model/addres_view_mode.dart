import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/globs.dart';
import '../common/service_call.dart';
import '../model/address_model.dart';

class AddressViewModel extends GetxController {
  final txtName = TextEditingController().obs;
  final txtMobile = TextEditingController().obs;
  final txtAddressLine = TextEditingController().obs;
  final txtCity = TextEditingController().obs;
  final txtState = TextEditingController().obs;
  final txtPostalCode = TextEditingController().obs;
  final txtType = "Home".obs;

  final RxList<AddressModel> listArr = <AddressModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("AddressViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svDeliveryAddress, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {

        clearAll();
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return AddressModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallUpdate(int addressId, VoidCallback didDone) {

     if(txtName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter name");
      return;
    }

    if (txtMobile.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter phone");
      return;
    }
    if (txtAddressLine.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter address");
      return;
    }

    if (txtCity.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter city");
      return;
    }

    if (txtState.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter state");
      return;
    }

    if (txtPostalCode.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter postal code");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "address_id": addressId.toString(),
      "name": txtName.value.text,
      "type_name": txtType.value,
      "phone": txtMobile.value.text,
      "address": txtAddressLine.value.text,
      "city": txtCity.value.text,
      "state": txtState.value.text,
      "postal_code": txtPostalCode.value.text
    }, SVKey.svUpdateDeliveryAddress, isToken: true,
        withSuccess: (resObj) async {
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

  void serviceCallRemove(AddressModel aObj) {
    Globs.showHUD();
    ServiceCall.post({"address_id": (aObj.addressId ?? 0).toString()},
        SVKey.svDeleteDeliveryAddress, isToken: true,
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

  void setDataModel(AddressModel aObj) {
    txtName.value.text = aObj.name ?? "";
    txtMobile.value.text = aObj.phone ?? "";
    txtAddressLine.value.text = aObj.address ?? "";
    txtCity.value.text = aObj.city ?? "";
    txtState.value.text = aObj.state ?? "";
    txtPostalCode.value.text = aObj.postalCode ?? "";
    txtType.value = aObj.typeName ?? "Home";
  }

  void clearAll() {
    txtName.value.text = "";
    txtMobile.value.text = "";
    txtAddressLine.value.text = "";
    txtCity.value.text = "";
    txtState.value.text = "";
    txtPostalCode.value.text = "";
    txtType.value = "Home";
  }

  void serviceCallAdd(VoidCallback didDone) {

    if(txtName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter name");
      return;
    }

    if (txtMobile.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter phone");
      return;
    }
    if (txtAddressLine.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter address");
      return;
    }

    if (txtCity.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter city");
      return;
    }

    if (txtState.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter state");
      return;
    }

    if (txtPostalCode.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter postal code");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "name": txtName.value.text,
      "type_name": txtType.value,
      "phone": txtMobile.value.text,
      "address": txtAddressLine.value.text,
      "city": txtCity.value.text,
      "state": txtState.value.text,
      "postal_code": txtPostalCode.value.text
    }, SVKey.svAddDeliveryAddress, isToken: true, withSuccess: (resObj) async {
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
