class PromoCodeModel {
  int? promoCodeId;
  String? code;
  String? title;
  String? description;
  int? type;
  int? minOrderAmount;
  int? maxDiscountAmount;
  int? offerPrice;
  String? startDate;
  String? endDate;
  String? createdDate;
  String? modifyDate;

  PromoCodeModel(
      {this.promoCodeId,
      this.code,
      this.title,
      this.description,
      this.type,
      this.minOrderAmount,
      this.maxDiscountAmount,
      this.offerPrice,
      this.startDate,
      this.endDate,
      this.createdDate,
      this.modifyDate});

  PromoCodeModel.fromJson(Map<String, dynamic> json) {
    promoCodeId = json['promo_code_id'];
    code = json['code'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    minOrderAmount = json['min_order_amount'];
    maxDiscountAmount = json['max_discount_amount'];
    offerPrice = json['offer_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdDate = json['created_date'];
    modifyDate = json['modify_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promo_code_id'] = this.promoCodeId;
    data['code'] = this.code;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['min_order_amount'] = this.minOrderAmount;
    data['max_discount_amount'] = this.maxDiscountAmount;
    data['offer_price'] = this.offerPrice;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_date'] = this.createdDate;
    data['modify_date'] = this.modifyDate;
    return data;
  }
}
