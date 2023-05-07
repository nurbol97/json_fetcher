// Created by alex@justprodev.com on 08.05.2023.

import 'constants_web.dart' if (dart.library.io) 'constants_mobile.dart';

/// FNV-1a 64bit hash algorithm optimized for Dart Strings
String fastHash(String string) {
  int hash = magic1;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= magic2;
    hash ^= codeUnit & 0xFF;
    hash *= magic2;
  }

  return hash.toString();
}
