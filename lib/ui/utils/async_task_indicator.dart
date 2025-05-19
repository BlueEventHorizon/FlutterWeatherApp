import 'package:flutter/material.dart';

/// 非同期の実行中にローディングインジケーターを表示する
Future<T> performTaskWithLoadingIndicator<T>({
  required BuildContext context,
  required Future<T> Function() task,
}) async {
  // オーバーレイエントリを作成
  final overlayEntry = OverlayEntry(
    builder: (context) => ColoredBox(
      color: Colors.black.withAlpha(80),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );

  // オーバーレイにローディングインジケーターを挿入
  Overlay.of(context).insert(overlayEntry);

  try {
    return await task();
  } finally {
    // タスクが完了したらオーバーレイを削除
    overlayEntry.remove();
  }
}
