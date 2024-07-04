// To parse this JSON data, do
//
//     final userActivityModel = userActivityModelFromJson(jsonString);

import 'dart:convert';

UserActivityModel userActivityModelFromJson(String str) =>
    UserActivityModel.fromJson(json.decode(str));

String userActivityModelToJson(UserActivityModel data) =>
    json.encode(data.toJson());

class UserActivityModel {
  final String accessId;
  final int userId;
  final String name;
  final String deviceName;
  final String ipAdderss;
  final String deviceType;
  final String deviceToken;
  final String latitude;
  final String longitude;
  final int isActive;
  final String loginTime;

  UserActivityModel({
    required this.accessId,
    required this.userId,
    required this.name,
    required this.deviceName,
    required this.ipAdderss,
    required this.deviceType,
    required this.deviceToken,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.loginTime,
  });

  factory UserActivityModel.fromJson(Map<String, dynamic> json) =>
      UserActivityModel(
        accessId: json["access_id"],
        userId: json["user_id"],
        name: json["name"],
        deviceName: json["deviceName"],
        ipAdderss: json["IpAdderss"],
        deviceType: json["deviceType"],
        deviceToken: json["deviceToken"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["is_active"],
        loginTime: json["loginTime"],
      );

  Map<String, dynamic> toJson() => {
        "access_id": accessId,
        "user_id": userId,
        "name": name,
        "deviceName": deviceName,
        "IpAdderss": ipAdderss,
        "deviceType": deviceType,
        "deviceToken": deviceToken,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
        "loginTime": loginTime,
      };
}
