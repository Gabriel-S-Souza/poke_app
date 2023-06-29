import 'dart:async';

import 'package:flutter/material.dart';

class Toast {
  final StreamController<ToastData> toastStream;
  final ValueNotifier<ToastCustomData?> toastCustomNotifier = ValueNotifier<ToastCustomData?>(null);

  static late Toast? _instance;

  Toast._internal() : toastStream = StreamController<ToastData>.broadcast();

  static Toast get instance {
    assert(_instance != null, 'Toast must be initialized before use');
    return _instance!;
  }

  static void initialize() {
    _instance = Toast._internal();
  }

  static void show(
    String message, {
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    Color? textColor,
    double opacity = 0.8,
    ToastBehavior? behavior,
  }) {
    final toast = ToastData(
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      opacity: opacity,
      behavior: behavior,
    );
    instance.toastStream.add(toast);
  }

  static Future<void> showCustom({
    required Widget Function(BuildContext context) builder,
    Duration? duration,
    bool activeFade = true,
  }) async {
    instance.toastCustomNotifier.value = ToastCustomData(
      builder: builder,
      duration: duration,
      activeFade: activeFade,
    );
  }

  static void removeCustomToast() {
    instance.toastCustomNotifier.value = null;
  }

  static void dispose() {
    _instance?.toastStream.close();
    _instance = null;
  }
}

class ToastData {
  final String message;
  final Duration duration;
  final Color? backgroundColor;
  final Color? textColor;
  final double opacity;
  final ToastBehavior? behavior;

  ToastData({
    required this.message,
    required this.duration,
    this.backgroundColor,
    this.textColor,
    this.opacity = 0.8,
    this.behavior,
  });
}

enum ToastBehavior {
  pinnedDown,
  pinnedUp,
  floating,
}

class ToastCustomData {
  final Duration? duration;
  final bool activeFade;
  final Widget Function(BuildContext context) builder;

  ToastCustomData({
    required this.duration,
    required this.builder,
    required this.activeFade,
  });
}
