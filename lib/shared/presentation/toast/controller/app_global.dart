import 'dart:async';

import 'package:flutter/material.dart';

class ToastController {
  final StreamController<ToastData> toastStream;

  static late ToastController? _instance;

  static ToastController get instance {
    assert(_instance != null, 'ToastController must be initialized before use');
    return _instance!;
  }

  factory ToastController() {
    assert(_instance != null, 'ToastController must be initialized before use');
    return _instance!;
  }

  static void initialize() {
    _instance = ToastController._internal();
  }

  ToastController._internal() : toastStream = StreamController<ToastData>.broadcast();

  static void show(
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? textColor,
    Color? closeButtonColor,
    final bool dismissible = true,
    VoidCallback? onDismiss,
    double opacity = 0.8,
  }) {
    final toast = ToastData(
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      closeButtonColor: closeButtonColor,
      onDismiss: onDismiss,
      dismissible: dismissible,
      opacity: opacity,
    );
    instance.toastStream.add(toast);
  }

  static void dispose() {
    _instance?.toastStream.close();
    _instance = null;
  }
}

class ToastData {
  final String message;
  final Duration duration;
  final VoidCallback? onDismiss;
  final Color? backgroundColor;
  final Color? textColor;
  final bool dismissible;
  final Color? closeButtonColor;
  final double opacity;

  ToastData({
    required this.message,
    required this.duration,
    this.onDismiss,
    this.backgroundColor,
    this.textColor,
    this.dismissible = false,
    this.closeButtonColor,
    this.opacity = 0.8,
  });
}
