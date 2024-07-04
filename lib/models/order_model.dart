// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    int? id;
    String? tokenName;
    String? txId;
    DateTime? date;
    String? time;
    String? type;
    dynamic price;
    double? slicePrice;
    dynamic quantity;
    String? currency;
    String? status;

    OrderModel({
        this.id,
        this.tokenName,
        this.txId,
        this.date,
        this.time,
        this.type,
        this.price,
        this.slicePrice,
        this.quantity,
        this.currency,
        this.status,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        tokenName: json["token_name"],
        txId: json["txId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        type: json["type"],
        price: json["price"],
        slicePrice: json["slice_price"]?.toDouble(),
        quantity: json["quantity"],
        currency: json["currency"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token_name": tokenName,
        "txId": txId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "type": type,
        "price": price,
        "slice_price": slicePrice,
        "quantity": quantity,
        "currency": currency,
        "status": status,
    };
}
