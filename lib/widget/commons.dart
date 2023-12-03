import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/alert/gf_alert.dart';

showErrorDialog(String content) {
  Get.dialog(GFAlert(
    width: 250,
    alignment: Alignment.center,
    backgroundColor: Colors.white,
    bottomBar: const Row(),
    title: 'Error',
    content: Text(
      content,
      style: const TextStyle(fontSize: 14, color: Colors.black),
    ),
  ));
}
