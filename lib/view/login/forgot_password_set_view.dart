import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/forgot_password_view_model.dart';

class ForgotPasswordSetView extends StatefulWidget {
  const ForgotPasswordSetView({super.key});

  @override
  State<ForgotPasswordSetView> createState() => _ForgotPasswordSetViewState();
}

class _ForgotPasswordSetViewState extends State<ForgotPasswordSetView> {
  final forgotVM = Get.put(ForgotPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset("assets/img/bottom_bg.png",
            width: media.width, height: media.height, fit: BoxFit.cover),
      ),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              )),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/color_logo.png",
                        width: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  Text(
                    "Enter your new password",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Obx(
                    () => LineTextField(
                      title: "New Password",
                      placeholder: "Enter your new password",
                      controller: forgotVM.txtNewPassword.value,
                      obscureText: !forgotVM.isShowPassword.value,
                      right: IconButton(
                          onPressed: () {
                            forgotVM.isShowPassword.value =
                                !forgotVM.isShowPassword.value;
                          },
                          icon: Icon(
                            !forgotVM.isShowPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: TColor.textTittle,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  LineTextField(
                    title: "Confirm Password",
                    placeholder: "Enter your confirm password",
                    controller: forgotVM.txtConfirmPassword.value,
                    obscureText: !forgotVM.isShowPassword.value,
                    right: IconButton(
                        onPressed: () {
                          forgotVM.isShowPassword.value =
                              !forgotVM.isShowPassword.value;
                        },
                        icon: Icon(
                          !forgotVM.isShowPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TColor.textTittle,
                        )),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                    title: "Submit",
                    onPressed: () {
                      forgotVM.serviceCallSetPassword();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
