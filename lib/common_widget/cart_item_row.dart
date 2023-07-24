import 'package:flutter/material.dart';
import 'package:online_groceries/common/color_extension.dart';

class CartItemRow extends StatelessWidget {
  final Map pObj;

  const CartItemRow({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  pObj["icon"],
                  width: 80,
                  height: 65,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                pObj["name"],
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/img/close.png",
                                width: 15,
                                height: 15,
                                color: TColor.secondaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${pObj["unit"]}",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          TColor.placeholder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/img/subtack.png",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              pObj["qty"].toString(),
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                          TColor.placeholder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/img/add_green.png",
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "\$${pObj["price"]}",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
