import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';
import 'package:online_groceries/view/login/welcome_view.dart';
import 'package:online_groceries/view/main_tabview/main_tabview.dart';

import '../model/user_payload_model.dart';

class SplashViewModel extends GetxController {
  final userPayload = UserPayloadModel().obs;

  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));

    if (Globs.udValueBool(Globs.userLogin)) {
      userPayload.value =
          UserPayloadModel.fromJson(Globs.udValue(Globs.userPayload));
      Get.to(() => const MainTabView());
    } else {
      Get.to(() => const WelcomeView());
    }
  }

  void goAfterLoginMainTab(){
    userPayload.value = UserPayloadModel.fromJson( Globs.udValue(Globs.userPayload));
    Get.to(() => const MainTabView() );
  }

  void setData() {
    userPayload.value =
        UserPayloadModel.fromJson(Globs.udValue(Globs.userPayload));
    
  }

  void logout() {
    userPayload.value = UserPayloadModel();
    Globs.udBoolSet(false, Globs.userLogin);
    Get.to(() => const WelcomeView());
  }
}
