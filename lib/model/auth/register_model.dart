import 'package:habitof/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel {
  RegisterModel(
      {required this.username, required this.email, required this.password});

  String username;
  String email;
  String password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
