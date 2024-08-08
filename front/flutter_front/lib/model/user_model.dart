import 'package:json_annotation/json_annotation.dart';

part "user_model.g.dart";

@JsonSerializable()
class User {
  final String email;
  final String? pseudo;

  User({required this.email, required this.pseudo});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
