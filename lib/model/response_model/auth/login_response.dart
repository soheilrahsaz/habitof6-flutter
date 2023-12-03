import 'package:habitof/model/response_model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse<bool> {
  LoginResponse();

  factory LoginResponse.fromJson(dynamic json) => _$LoginResponseFromJson(json);
}
