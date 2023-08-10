class PaymentModel {
  int? payId;
  String? name;
  String? cardNumber;
  String? cardMonth;
  String? cardYear;

  PaymentModel(
      {this.payId, this.name, this.cardNumber, this.cardMonth, this.cardYear});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    payId = json['pay_id'];
    name = json['name'];
    cardNumber = json['card_number'];
    cardMonth = json['card_month'];
    cardYear = json['card_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pay_id'] = payId;
    data['name'] = name;
    data['card_number'] = cardNumber;
    data['card_month'] = cardMonth;
    data['card_year'] = cardYear;
    return data;
  }
}
