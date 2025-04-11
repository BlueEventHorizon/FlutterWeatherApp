import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    // 実装案（２）
    //unawaited(_action());

    // 実装案（１）
    unawaited(
      SchedulerBinding.instance.endOfFrame.then(
        (_) => actionAfterLayout(),
      ),
    );
  }

  // 実装案（２）
  // Future<void> _action() async {
  //   await SchedulerBinding.instance.endOfFrame;
  //   await actionAfterLayout();
  // }

  Future<void> actionAfterLayout();
}
