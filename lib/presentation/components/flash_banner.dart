import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class AppFlash {
  static void showBanner(context,
      {required String message,
      FlashBehavior flashStyle = FlashBehavior.floating,
      Color? backgroundColor}) {
    showFlash(
      context: context,
      barrierBlur: 3,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 333),
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            useSafeArea: true,
            position: FlashPosition.top,
            backgroundColor: backgroundColor,
            behavior: FlashBehavior.floating,
            dismissDirections: const [FlashDismissDirection.vertical],
            content: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
