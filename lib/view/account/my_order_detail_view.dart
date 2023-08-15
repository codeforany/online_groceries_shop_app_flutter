import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common_widget/my_order_row.dart';
import 'package:online_groceries/view_model/addres_view_mode.dart';

import '../../common/color_extension.dart';
import '../../common_widget/order_item_row.dart';
import '../../model/my_order_model.dart';
import '../../view_model/my_order_detail_view_model.dart';

class MyOrdersDetailView extends StatefulWidget {
  final MyOrderModel mObj;
  const MyOrdersDetailView({super.key, required this.mObj});

  @override
  State<MyOrdersDetailView> createState() => _MyOrdersDetailViewState();
}

class _MyOrdersDetailViewState extends State<MyOrdersDetailView> {
  late MyOrderDetailViewModel detailVM;

  @override
  void initState() {
    super.initState();
    detailVM = Get.put(MyOrderDetailViewModel(widget.mObj));
  }

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
          "My Order Detail",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Order ID: #${widget.mObj.orderId}",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          getPaymentStatus(widget.mObj),
                          style: TextStyle(
                              color: getPaymentStatusColor(widget.mObj),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${widget.mObj.createdDate}",
                            style: TextStyle(
                                color: TColor.secondaryText, fontSize: 12),
                          ),
                        ),
                        Text(
                          getOrderStatus(widget.mObj),
                          style: TextStyle(
                              color: getOrderStatusColor(widget.mObj),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.mObj.address ?? ""}, ${widget.mObj.city ?? ""}, ${widget.mObj.state ?? ""}, ${widget.mObj.postalCode} ",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery Type: ",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            getDeliverType(widget.mObj),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Payment Type: ",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            getPaymentType(widget.mObj),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            

            Obx(
              () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  itemBuilder: (context, index) {
                    var pObj = detailVM.cartList[index];
                    return OrderItemRow(
                      pObj: pObj,
                    );
                  },
                  itemCount: detailVM.cartList.length),
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Amount:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                          child: Text(
                            " \$${(widget.mObj.totalPrice ?? 0).toStringAsFixed(2)}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery Cost:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                          child: Text(
                            "+ \$${(widget.mObj.deliverPrice ?? 0).toStringAsFixed(2)}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Discount:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                          child: Text(
                            "- \$${(widget.mObj.discountPrice ?? 0).toStringAsFixed(2)}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Colors.black12),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                          child: Text(
                            "\$${(widget.mObj.userPayPrice ?? 0).toStringAsFixed(2)}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
