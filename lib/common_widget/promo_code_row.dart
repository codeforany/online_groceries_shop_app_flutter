import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import '../model/promo_code_model.dart';

class PromoCodeRow extends StatelessWidget {
  final PromoCodeModel  pObj;
  final VoidCallback onTap;
  const PromoCodeRow({super.key, required this.pObj, required this.onTap });

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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            pObj.title ?? "",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: TColor.secondaryText.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            pObj.code ?? "",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      pObj.description ?? "",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
    
                    const SizedBox(
                      height: 4,
                    ),
    
                    Row(
                      children: [
                        Text(
                         "Expiry Date:",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
    
                        const SizedBox(width: 8,),
                        Text(
                          pObj.endDate ?? "",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                   
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}