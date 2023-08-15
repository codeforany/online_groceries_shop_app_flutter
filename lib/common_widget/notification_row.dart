import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import '../model/notification_model.dart';

class NotificationRow extends StatelessWidget {
  final NotificationModel nObj;
  final VoidCallback onTap;
  const NotificationRow({super.key, required this.nObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: nObj.isRead == 1 ? TColor.placeholder : Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nObj.title ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),

                        Text(
                          nObj.createdDate ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.secondaryText, fontSize: 12),
                        ),
                      ],
                    ),
                    
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      nObj.message ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                    
                  ],
                ),
              ),
            
            
          ],
        ),
      ),
    );
  }
}
