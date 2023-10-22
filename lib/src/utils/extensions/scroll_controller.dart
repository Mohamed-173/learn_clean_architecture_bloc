import 'package:flutter/widgets.dart';

extension ScrollControllerExtension on ScrollController {
  void onScrollEndListener(
    final void Function() callback, {
    double offset = 0,
  }) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels - offset;

      if (currentScroll == maxScroll) {
        callback();
      }
    });
  }
}
