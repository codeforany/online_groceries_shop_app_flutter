class CartItemModel {
  int? cartId;
  int? userId;
  int? prodId;
  int? qty;
  int? catId;
  int? brandId;
  int? typeId;
  String? name;
  String? detail;
  String? unitName;
  String? unitValue;
  String? nutritionWeight;
  double? price;
  String? createdDate;
  String? modifyDate;
  String? catName;
  int? isFav;
  String? brandName;
  String? typeName;
  double? offerPrice;
  String? startDate;
  String? endDate;
  int? isOfferActive;
  String? image;
  double? itemPrice;
  double? totalPrice;

  CartItemModel(
      {this.cartId,
      this.userId,
      this.prodId,
      this.qty,
      this.catId,
      this.brandId,
      this.typeId,
      this.name,
      this.detail,
      this.unitName,
      this.unitValue,
      this.nutritionWeight,
      this.price,
      this.createdDate,
      this.modifyDate,
      this.catName,
      this.isFav,
      this.brandName,
      this.typeName,
      this.offerPrice,
      this.startDate,
      this.endDate,
      this.isOfferActive,
      this.image,
      this.itemPrice,
      this.totalPrice});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    prodId = json['prod_id'];
    qty = json['qty'];
    catId = json['cat_id'];
    brandId = json['brand_id'];
    typeId = json['type_id'];
    name = json['name'];
    detail = json['detail'];
    unitName = json['unit_name'];
    unitValue = json['unit_value'];
    nutritionWeight = json['nutrition_weight'];
    price = json['price'];
    createdDate = json['created_date'];
    modifyDate = json['modify_date'];
    catName = json['cat_name'];
    isFav = json['is_fav'];
    brandName = json['brand_name'];
    typeName = json['type_name'];
    offerPrice = json['offer_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isOfferActive = json['is_offer_active'];
    image = json['image'];
    itemPrice = json['item_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cart_id'] = cartId;
    data['user_id'] = userId;
    data['prod_id'] = prodId;
    data['qty'] = qty;
    data['cat_id'] = catId;
    data['brand_id'] = brandId;
    data['type_id'] = typeId;
    data['name'] = name;
    data['detail'] = detail;
    data['unit_name'] = unitName;
    data['unit_value'] = unitValue;
    data['nutrition_weight'] = nutritionWeight;
    data['price'] = price;
    data['created_date'] = createdDate;
    data['modify_date'] = modifyDate;
    data['cat_name'] = catName;
    data['is_fav'] = isFav;
    data['brand_name'] = brandName;
    data['type_name'] = typeName;
    data['offer_price'] = offerPrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_offer_active'] = isOfferActive;
    data['image'] = image;
    data['item_price'] = itemPrice;
    data['total_price'] = totalPrice;
    return data;
  }
}
