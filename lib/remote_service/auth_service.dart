import 'package:get/get.dart';
import 'package:habitof/model/auth/login_model.dart';
import 'package:habitof/model/auth/register_model.dart';
import 'package:habitof/model/response_model/auth/login_response.dart';
import 'package:habitof/model/response_model/auth/register_response.dart';
import 'package:habitof/remote_service/base_service.dart';

class AuthService extends BaseService {
  @override
  String get baseServicePath => "/auth";

  Future<Response<RegisterResponse>> registerUser(RegisterModel registerModel) {
    return doPost("/register", registerModel.toJson(),
        decoder: RegisterResponse.fromJson);
  }

  Future<Response<LoginResponse>> loginUser(LoginModel loginModel) {
    return doPost("/login", loginModel.toJson(),
        decoder: LoginResponse.fromJson);
  }
}
