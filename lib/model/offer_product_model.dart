class OfferProductModel {
  double? offerPrice;
  String? startDate;
  String? endDate;
  int? prodId;
  int? catId;
  int? brandId;
  int? typeId;
  String? name;
  String? detail;
  String? unitName;
  String? unitValue;
  String? nutritionWeight;
  double? price;
  String? image;
  String? catName;
  String? typeName;
  bool? isFav;

  OfferProductModel(
      {this.offerPrice,
      this.startDate,
      this.endDate,
      this.prodId,
      this.catId,
      this.brandId,
      this.typeId,
      this.name,
      this.detail,
      this.unitName,
      this.unitValue,
      this.nutritionWeight,
      this.price,
      this.image,
      this.catName,
      this.typeName,
      this.isFav});

  OfferProductModel.fromJson(Map<String, dynamic> json) {
    offerPrice = json['offer_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    prodId = json['prod_id'];
    catId = json['cat_id'];
    brandId = json['brand_id'];
    typeId = json['type_id'];
    name = json['name'];
    detail = json['detail'];
    unitName = json['unit_name'];
    unitValue = json['unit_value'];
    nutritionWeight = json['nutrition_weight'];
    price = json['price'];
    image = json['image'];
    catName = json['cat_name'];
    typeName = json['type_name'];
    isFav = (json['is_fav'] as int? ?? 0) == 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['offer_price'] = offerPrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['prod_id'] = prodId;
    data['cat_id'] = catId;
    data['brand_id'] = brandId;
    data['type_id'] = typeId;
    data['name'] = name;
    data['detail'] = detail;
    data['unit_name'] = unitName;
    data['unit_value'] = unitValue;
    data['nutrition_weight'] = nutritionWeight;
    data['price'] = price;
    data['image'] = image;
    data['cat_name'] = catName;
    data['type_name'] = typeName;
    data['is_fav'] = isFav;
    return data;
  }
}
