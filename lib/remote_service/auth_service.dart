import 'package:get/get.dart';
import 'package:habitof/model/auth/register_model.dart';
import 'package:habitof/model/response_model/auth/register_response.dart';
import 'package:habitof/remote_service/base_service.dart';

class AuthService extends BaseService {
  @override
  String get baseServicePath => "/auth";

  void registerUser(RegisterModel registerModel) async {
    Response<RegisterResponse> res = await doPost(
        "/register", registerModel.toJson(),
        decoder: RegisterResponse.fromJson);

    print(res.body!.result);
    print(res.body!.error);
  }
}
