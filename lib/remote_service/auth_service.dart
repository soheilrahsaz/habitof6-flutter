import 'package:get/get.dart';
import 'package:habitof/model/register_model.dart';

class AuthService extends GetConnect {
  void registerUser(RegisterModel registerModel) async {
    Response res = await post(
        "http://habitof.soheilrahsaz.ir/api/v1/auth/register", registerModel);
    print(res.body);
  }
}
