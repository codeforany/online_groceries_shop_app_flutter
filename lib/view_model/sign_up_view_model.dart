import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/common/service_call.dart';
import 'package:online_groceries/view_model/splash_view_model.dart';

class SignUpViewModel extends GetxController {
  final txtUsername = TextEditingController().obs;
  final txtEmail = TextEditingController().obs;
  final txtPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("SignUpViewModel Init ");
    }
    txtUsername.value.text = "User1";
    txtEmail.value.text = "user1@gmail.com";
    txtPassword.value.text = "123456";
  }

  //ServiceCall
  void serviceCallSignUp() {

    if(txtUsername.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Pleaser enter username");
      return;
    }

    if ( !GetUtils.isEmail(  txtEmail.value.text )  ) {
      Get.snackbar(Globs.appName, "Pleaser enter valid email address");
      return;
    }

    if (txtPassword.value.text.length < 6) {
      Get.snackbar(Globs.appName, "Pleaser enter valid password min 6 character");
      return;
    }

    Globs.showHUD();

    ServiceCall.post({
      "username": txtUsername.value.text,
      "email": txtEmail.value.text,
      "password": txtPassword.value.text,
      "dervice_token": ""
    }, SVKey.svSignUp, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var payload = resObj[KKey.payload] as Map? ?? {};

        Globs.udSet(payload, Globs.userPayload);
        Globs.udBoolSet(true, Globs.userLogin);

        
        Get.delete<SignUpViewModel>();
        Get.find<SplashViewModel>().goAfterLoginMainTab();
      } else {}

      Get.snackbar(Globs.appName, resObj["message"].toString());
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
