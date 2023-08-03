class ImageModel {
  int? imgId;
  int? prodId;
  String? image;

  ImageModel({this.imgId, this.prodId, this.image});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imgId = json['img_id'];
    prodId = json['prod_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['img_id'] = imgId;
    data['prod_id'] = prodId;
    data['image'] = image;
    return data;
  }
}
