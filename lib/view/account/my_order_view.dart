import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/my_order_row.dart';
import 'package:online_groceries/view_model/addres_view_mode.dart';

import '../../common/color_extension.dart';
import '../../view_model/my_orders_view_model.dart';
import 'my_order_detail_view.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  final myVM = Get.put(MyOrdersViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<AddressViewModel>();
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
          "My Orders",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => myVM.listArr.isEmpty ? Center(
          child: Text(
                  "No Any Order Place",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
        ) :  ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var mObj = myVM.listArr[index];
              return MyOrderRow(mObj: mObj, onTap: () {
                Get.to( () => MyOrdersDetailView(mObj: mObj) );
              });
            },
            itemCount: myVM.listArr.length),
      ),
    );
  }
}
