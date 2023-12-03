import 'dart:async';
import 'dart:ui';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget {
  static bool _isActive = false;
  static Timer? _timer;

  //
  static bool _myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  static void active() {
    if (!_isActive) {
      _isActive = true;
      _delayTimer();
      if (kDebugMode) {}
      BackButtonInterceptor.add(_myInterceptor);
      loadingPage();
    }
  }

  static void disable() {
    if (_isActive) {
      _timer?.cancel();
      if (kDebugMode) {
        print('loading disable . . .');
      }
      Get.back();
      BackButtonInterceptor.remove(_myInterceptor);
      _isActive = false;
    }
  }

  static void _delayTimer() {
    _timer = Timer(const Duration(seconds: 600), () {
      if (_isActive) {
        disable();
      }
    });
  }

//
}

Future<dynamic> loadingPage() {
  var loadingIcon = LoadingAnimationWidget.threeRotatingDots(
    color: Colors.white70,
    size: 80,
  );
  return Get.dialog(
    Material(
      color: Colors.transparent,
      child: Align(
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loadingIcon,
                const SizedBox(
                  height: 30,
                ),
                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "Loading",
                    //style: Styles.bigBtnTxtStyle,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.8),
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 200),
  );
}
