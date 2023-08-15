import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/line_textfield.dart';
import 'package:online_groceries/common_widget/round_button.dart';
import 'package:online_groceries/view/account/change_password_view.dart';

import '../../common/color_extension.dart';
import '../../view_model/my_detail_view_model.dart';

class MyDetailView extends StatefulWidget {
  const MyDetailView({super.key});

  @override
  State<MyDetailView> createState() => _MyDetailViewState();
}

class _MyDetailViewState extends State<MyDetailView> {
  final detailVM = Get.put(MyDetailViewModel());

  FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = countryPicker.countryCodes.firstWhere(
        (element) => element.code == detailVM.txtMobileCode.value,
        orElse: () => countryPicker.countryCodes.first);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<MyDetailViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        centerTitle: true,
        title: Text(
          "My Details",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  LineTextField(
                      title: "Username",
                      placeholder: "Enter you username",
                      controller: detailVM.txtUsername.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Name",
                      placeholder: "Enter you name",
                      controller: detailVM.txtName.value),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                            color: TColor.textTittle,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextField(
                        controller: detailVM.txtMobile.value,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () async {
                              final code = await countryPicker.showPicker(
                                  context: context);

                              if (code != null) {
                                countryCode = code;
                                detailVM.txtMobileCode.value = code.code;
                                if (mounted) {
                                  setState(() {});
                                }
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 35,
                                  height: 35,
                                  child: countryCode.flagImage(),
                                ),
                                Text(
                                  countryCode.dialCode,
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                              color: TColor.placeholder, fontSize: 17),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: const Color(0xffE2E2E2),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Update",
                  onPressed: () {
                    detailVM.serviceCallUpdate(() {
                      Navigator.pop(context);
                    });
                  }),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const ChangePasswordView());
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: TColor.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
