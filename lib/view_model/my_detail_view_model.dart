import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/view_model/splash_view_model.dart';

import '../common/globs.dart';
import '../common/service_call.dart';

class MyDetailViewModel extends GetxController {
  final txtName = TextEditingController().obs;
  final txtMobile = TextEditingController().obs;
  final txtUsername = TextEditingController().obs;
  final txtMobileCode = "".obs;

  final txtCurrentPassword = TextEditingController().obs;
  final txtNewPassword = TextEditingController().obs;
  final txtConfirmPassword = TextEditingController().obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("MyDetailViewModel Init ");
    }

    setDataModel();
  }

  //ServiceCall

  void serviceCallUpdate(VoidCallback didDone) {
    if (txtName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter name");
      return;
    }

    if (txtMobile.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter phone");
      return;
    }
    if (txtUsername.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter username");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "name": txtName.value.text,
      "mobile": txtMobile.value.text,
      "username": txtUsername.value.text,
      "mobile_code": txtMobileCode.value
    }, SVKey.svUpdateProfile, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        Get.snackbar(Globs.appName, resObj[KKey.message].toString());
        var payload = resObj[KKey.payload] as Map? ?? {};

        Globs.udSet(payload, Globs.userPayload);
        Globs.udBoolSet(true, Globs.userLogin);
        Get.find<SplashViewModel>().setData();
        didDone();
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallSetPassword(VoidCallback didDone) {
    if (txtCurrentPassword.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter current password");
      return;
    }

    if (txtNewPassword.value.text.length < 6) {
      Get.snackbar(Globs.appName, "Please enter new password minimum 6 character");
      return;
    }
     if (txtNewPassword.value.text 
     != txtConfirmPassword.value.text) {
      Get.snackbar(
          Globs.appName, "password not match");
      return;
    }

    Globs.showHUD();
    ServiceCall.post({
      "current_password": txtCurrentPassword.value.text,
      "new_password": txtNewPassword.value.text
    }, SVKey.svChangePassword, isToken: true, withSuccess: (resObj) async {
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

  void setDataModel() {
    final sVM = Get.find<SplashViewModel>();
    txtName.value.text = sVM.userPayload.value.name ?? "";
    txtMobile.value.text = sVM.userPayload.value.mobile ?? "";
    txtUsername.value.text = sVM.userPayload.value.username ?? "";
    txtMobileCode.value = sVM.userPayload.value.mobileCode ?? "";
  }

  void clearAll() {
    txtName.value.text = "";
    txtMobile.value.text = "";
    txtUsername.value.text = "";
    txtMobileCode.value = "";
    
  }

  void clearPassword(){
    txtConfirmPassword.value.text = "";
    txtNewPassword.value.text = "";
    txtConfirmPassword.value.text = "";
    
  }
}
