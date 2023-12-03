import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:habitof/model/response_model/base_response.dart';
import 'package:habitof/widget/commons.dart';
import 'package:habitof/widget/loading.dart';

class RequestHandler<T extends BaseResponse> {
  RequestHandler({this.formKey, required this.requestFunc}) {
    _init();
  }

  GlobalKey<FormBuilderState>? formKey;
  Future<Response<T>> Function() requestFunc;

  void _init() async {
    LoadingWidget.active();
    Response<T> response = await requestFunc();
    LoadingWidget.disable();

    if (response.body != null) {
      T body = response.body!;
      if (body.error != null) {
        showErrorDialog(body.error!);
      }
    }
  }
}
