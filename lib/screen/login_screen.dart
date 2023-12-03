import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:habitof/model/auth/login_model.dart';
import 'package:habitof/model/response_model/auth/login_response.dart';
import 'package:habitof/remote_service/auth_service.dart';
import 'package:habitof/remote_service/request_handler.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(children: [
          FormBuilderTextField(
              name: 'username',
              decoration: const InputDecoration(labelText: 'Username'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
                FormBuilderValidators.maxLength(16)
              ])),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
              FormBuilderValidators.maxLength(32)
            ]),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                RequestHandler<LoginResponse>(
                    requestFunc: () => AuthService().loginUser(LoginModel(
                        username: _formKey.currentState?.value["username"],
                        password: _formKey.currentState?.value["password"])),
                    formKey: _formKey);
              }
            },
            child: const Text('Login'),
          ),
        ]),
      ),
    );
  }
}
