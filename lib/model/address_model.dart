class AddressModel {
  int? addressId;
  String? name;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? typeName;
  String? postalCode;
  int? isDefault;

  AddressModel(
      {this.addressId,
      this.name,
      this.phone,
      this.address,
      this.city,
      this.state,
      this.typeName,
      this.postalCode,
      this.isDefault});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    typeName = json['type_name'];
    postalCode = json['postal_code'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address_id'] = addressId;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['type_name'] = typeName;
    data['postal_code'] = postalCode;
    data['is_default'] = isDefault;
    return data;
  }
}
