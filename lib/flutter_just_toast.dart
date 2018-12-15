import 'dart:async';

import 'package:flutter/services.dart';

class Toast {
  static const MethodChannel _channel =
      const MethodChannel('flutter_just_toast');

  static Future<String> show({String message, Duration duration}) async {
    String _duration = "short";

    if (duration == Duration.LONG) {
      _duration = "long";
    }

    var _toastValues = {"message":message,"duration":_duration};

    String _result = await _channel.invokeMethod("toast",_toastValues);

    return _result;
  }
}

enum Duration { SHORT, LONG }
