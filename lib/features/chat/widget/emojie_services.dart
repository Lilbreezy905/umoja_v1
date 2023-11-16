import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class EmojisServices {
  static const _platform = MethodChannel('emoji_picker_flutter');

  Future<CategoryEmoji> getCategoryEmojis(
      {required CategoryEmoji category}) async {
    var available = (await _platform.invokeListMethod<bool>(
        'getSupportedEmojis', {
      'source': category.emoji.map((e) => e.emoji).toList(growable: false)
    }))!;

    return category.copyWith(emoji: [
      for (int i = 0; i < available.length; i++)
        if (available[i]) category.emoji[i]
    ]);
  }

  Future<List<CategoryEmoji>> filterUnsupported(
      {required List<CategoryEmoji> data}) async {
    if (kIsWeb || !Platform.isAndroid) {
      return data;
    }
    final futures = [for (final cat in data) getCategoryEmojis(category: cat)];
    return await Future.wait(futures);
  }
}