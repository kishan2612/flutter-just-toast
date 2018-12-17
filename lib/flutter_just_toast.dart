import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Toast {
  static const MethodChannel _channel =
      const MethodChannel('flutter_just_toast');

  static Future<String> show({
    String message,
    Delay duration,
    Color backgroundColor = Colors.grey,
    Color textColor = Colors.black
    }) async {

    String _duration = "short";

    if (duration == Delay.LONG) {
      _duration = "long";
    }

    var _toastValues = {
      "message":message,
      "duration":_duration,
      "backgroundColor": backgroundColor.value,
      "textColor": textColor.value
    };

    String _result = await _channel.invokeMethod("toast",_toastValues);

    return _result;
  }
}

enum Delay { SHORT, LONG }
