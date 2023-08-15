import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/notification_row.dart';
import 'package:online_groceries/model/address_model.dart';

import '../../common/color_extension.dart';
import '../../view_model/notification_view_model.dart';

class NotificationListView extends StatefulWidget {
  final Function(AddressModel aObj)? didSelect;
  const NotificationListView({super.key, this.didSelect});

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  final notiVM = Get.put(NotificationViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<NotificationViewModel>();
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
            "Notifications",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            TextButton(
              onPressed: () {
                notiVM.serviceCallReadAll();
              },
              child: Text(
                "Read All",
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )
          ]),
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var nObj = notiVM.listArr[index];
              return NotificationRow(
                nObj: nObj,
                onTap: () {},
              );
            },
            itemCount: notiVM.listArr.length),
      ),
    );
  }
}
