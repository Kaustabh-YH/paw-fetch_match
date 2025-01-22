import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {

  Debouncer({this.milliseconds=500});
  final int milliseconds;

  Timer? _timer;

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}