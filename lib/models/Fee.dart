// To parse this JSON data, do
//
//     final fee = feeFromMap(jsonString);

import 'dart:convert';

class Fee {
  Fee({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory Fee.fromJson(String str) => Fee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fee.fromMap(Map<String, dynamic> json) => Fee(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
        "message": message,
      };
}

class Data {
  Data({
    this.fees,
    this.currencySymbol,
  });

  List<FeeElement>? fees;
  CurrencySymbol? currencySymbol;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        fees: json["fees"] == null
            ? null
            : List<FeeElement>.from(
                json["fees"].map((x) => FeeElement.fromMap(x))),
        currencySymbol: json["currency_symbol"] == null
            ? null
            : CurrencySymbol.fromMap(json["currency_symbol"]),
      );

  Map<String, dynamic> toMap() => {
        "fees": fees == null
            ? null
            : List<dynamic>.from(fees!.map((x) => x.toMap())),
        "currency_symbol":
            currencySymbol == null ? null : currencySymbol!.toMap(),
      };
}

class CurrencySymbol {
  CurrencySymbol({
    this.currencySymbol,
  });

  String? currencySymbol;

  factory CurrencySymbol.fromJson(String str) =>
      CurrencySymbol.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencySymbol.fromMap(Map<String, dynamic> json) => CurrencySymbol(
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
      );

  Map<String, dynamic> toMap() => {
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
      };
}

class FeeElement {
  FeeElement({
    this.feesTypeId,
    this.feesName,
    this.dueDate,
    this.amount,
    this.paid,
    this.fine,
    this.discountAmount,
    this.balance,
  });

  String? feesTypeId;
  String? feesName;
  DateTime? dueDate;
  String? amount;
  String? paid;
  String? fine;
  dynamic discountAmount;
  int? balance;

  factory FeeElement.fromJson(String str) =>
      FeeElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeeElement.fromMap(Map<String, dynamic> json) => FeeElement(
        feesTypeId: json["fees_type_id"] == null ? null : json["fees_type_id"],
        feesName: json["fees_name"] == null ? null : json["fees_name"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        amount: json["amount"] == null ? null : json["amount"],
        paid: json["paid"] == null ? null : json["paid"],
        fine: json["fine"] == null ? null : json["fine"],
        discountAmount:
            json["discount_amount"] == null ? 0 : json["discount_amount"],
        balance: json["balance"] == null ? null : json["balance"],
      );

  Map<String, dynamic> toMap() => {
        "fees_type_id": feesTypeId == null ? null : feesTypeId,
        "fees_name": feesName == null ? null : feesName,
        "due_date": dueDate == null
            ? null
            : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "amount": amount == null ? null : amount,
        "paid": paid == null ? null : paid,
        "fine": fine == null ? null : fine,
        "discount_amount": discountAmount,
        "balance": balance == null ? null : balance,
      };
}
