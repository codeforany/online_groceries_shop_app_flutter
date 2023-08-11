import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/model/address_model.dart';
import 'package:online_groceries/view/account/add_address_view.dart';
import 'package:online_groceries/view_model/addres_view_mode.dart';

import '../common/color_extension.dart';

class AddressRow extends StatelessWidget {
  final AddressModel aObj;
  final VoidCallback didUpdateDone;
  final VoidCallback onTap;
  const AddressRow({super.key, required this.aObj, required this.onTap, required this.didUpdateDone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            aObj.name ?? "",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              color: TColor.secondaryText.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            aObj.typeName ?? "Home",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${aObj.address ?? ""}, ${aObj.city ?? ""}, ${aObj.state ?? ""}, ${aObj.postalCode} ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      aObj.phone ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    Get.find<AddressViewModel>().setDataModel(aObj);
                    await Get.to(() =>  AddAddressView(aObj: aObj, isEdit: true,) );
                    didUpdateDone();
                  },
                  icon: Icon(
                    Icons.edit,
                    color: TColor.primary,
                    size: 20,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.find<AddressViewModel>().serviceCallRemove(aObj);
                    },
                    icon: Image.asset(
                      "assets/img/close.png",
                      width: 15,
                      height: 15,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
