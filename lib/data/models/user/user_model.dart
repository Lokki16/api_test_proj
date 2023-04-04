import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(anyMap: true)
class UserModel {
  final String accessToken;
  final String refreshToken;

  @override
  const UserModel({required this.accessToken, required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
