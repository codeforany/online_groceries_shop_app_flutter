import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/model/promo_code_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/promo_code_row.dart';
import '../../view_model/promo_code_view_model.dart';

class PromoCodeView extends StatefulWidget {
  final Function(PromoCodeModel pObj)? didSelect;
  const PromoCodeView({super.key, this.didSelect });

  @override
  State<PromoCodeView> createState() => _PromoCodeViewState();
}

class _PromoCodeViewState extends State<PromoCodeView> {
  final promoVM = Get.put(PromoCodeViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<PromoCodeViewModel>();
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
            "Promo Code",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
         ),
      backgroundColor: Colors.white,
      body:  Obx(
        () =>  promoVM.listArr.isEmpty
            ? Center(
                child: Text(
                  "No Any Promo Code Available",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              )
            :  ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var pObj = promoVM.listArr[index];
              return  PromoCodeRow(pObj: pObj, onTap: (){
                  if(widget.didSelect != null) {
                    widget.didSelect!(pObj);
                    Get.back();
                  }
              });
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.black12, height: 1),
            itemCount: promoVM.listArr.length),
      ),
    );
  }
}
