import 'package:flutter_front/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part "users_model.g.dart";

@JsonSerializable()
class UserData {
  final List<User> users;

  UserData({required this.users});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
