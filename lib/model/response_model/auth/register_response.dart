import 'package:habitof/model/response_model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends BaseResponse<bool> {
  RegisterResponse();

  factory RegisterResponse.fromJson(dynamic json) =>
      _$RegisterResponseFromJson(json);
}
