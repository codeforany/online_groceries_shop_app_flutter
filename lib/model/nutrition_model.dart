class NutritionModel {
  int? nutritionId;
  int? prodId;
  String? nutritionName;
  String? nutritionValue;

  NutritionModel(
      {this.nutritionId, this.prodId, this.nutritionName, this.nutritionValue});

  NutritionModel.fromJson(Map<String, dynamic> json) {
    nutritionId = json['nutrition_id'];
    prodId = json['prod_id'];
    nutritionName = json['nutrition_name'];
    nutritionValue = json['nutrition_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nutrition_id'] = nutritionId;
    data['prod_id'] = prodId;
    data['nutrition_name'] = nutritionName;
    data['nutrition_value'] = nutritionValue;
    return data;
  }
}
