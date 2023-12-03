import 'package:habitof/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel {
  LoginModel({required this.username, required this.password});

  final String username;
  final String password;

  @override
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
