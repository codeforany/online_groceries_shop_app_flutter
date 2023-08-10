import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/line_textfield.dart';
import 'package:online_groceries/common_widget/round_button.dart';
import 'package:online_groceries/view_model/payment_view_model.dart';

import '../../common/color_extension.dart';

class AddPaymentMethodView extends StatefulWidget {
  const AddPaymentMethodView({super.key});

  @override
  State<AddPaymentMethodView> createState() => _AddPaymentMethodViewState();
}

class _AddPaymentMethodViewState extends State<AddPaymentMethodView> {
  final payVM = Get.put(PaymentViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<PaymentViewModel>();
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
          "Add Payment Method",
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
                      title: "Name",
                      placeholder: "Enter you name",
                      controller: payVM.txtName.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Card Number",
                      placeholder: "Enter you Card Number",
                      keyboardType: TextInputType.phone,
                      controller: payVM.txtCardNumber.value),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: LineTextField(
                              title: "MM",
                              placeholder: "Enter MM",
                              keyboardType: TextInputType.number,
                              controller: payVM.txtMonth.value)),
                           const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: LineTextField(
                              title: "YYYY",
                              placeholder: "Enter YYYY",
                              keyboardType: TextInputType.number,
                              controller: payVM.txtYear.value))
                    ],
                  ),
                 
                  
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title:  "Add Payment Method",
                  onPressed: () {
                    
                      payVM.serviceCallAdd(() {
                        Navigator.pop(context);
                      });
                    
                  })
            ],
          ),
        ),
      ),
    );
  }
}
