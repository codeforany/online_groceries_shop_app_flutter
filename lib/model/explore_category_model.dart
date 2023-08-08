import 'dart:ui';

import '../common/color_extension.dart';

class ExploreCategoryModel {
  int? catId;
  String? catName;
  String? image;
  Color? color;

  ExploreCategoryModel({this.catId, this.catName, this.image, this.color});

  ExploreCategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    image = json['image'];
    color = HexColor.fromHex(json['color'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['image'] = image;
    data['color'] = color?.toHex();
    return data;
  }
}
