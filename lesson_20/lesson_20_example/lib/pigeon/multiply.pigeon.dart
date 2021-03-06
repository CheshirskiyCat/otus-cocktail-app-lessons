// Autogenerated from Pigeon (v0.1.17), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import
// @dart = 2.8
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/services.dart';

class MultiplyResult {
  int result;

  // ignore: unused_element
  Object encode() {
    final Map<Object, Object> pigeonMap = <Object, Object>{};
    pigeonMap['result'] = result;
    return pigeonMap;
  }

  // ignore: unused_element
  static MultiplyResult decode(Object message) {
    final Map<Object, Object> pigeonMap = message as Map<Object, Object>;
    return MultiplyResult()
      ..result = pigeonMap['result'] as int;
  }
}

class MultiplyRequest {
  int multiplicand;
  int multiplier;

  // ignore: unused_element
  Object encode() {
    final Map<Object, Object> pigeonMap = <Object, Object>{};
    pigeonMap['multiplicand'] = multiplicand;
    pigeonMap['multiplier'] = multiplier;
    return pigeonMap;
  }

  // ignore: unused_element
  static MultiplyRequest decode(Object message) {
    final Map<Object, Object> pigeonMap = message as Map<Object, Object>;
    return MultiplyRequest()
      ..multiplicand = pigeonMap['multiplicand'] as int
      ..multiplier = pigeonMap['multiplier'] as int;
  }
}

class MultiplyApi {
  Future<MultiplyResult> multiply(MultiplyRequest arg) async {
    final Object encoded = arg.encode();
    const BasicMessageChannel<Object> channel =
        BasicMessageChannel<Object>('dev.flutter.pigeon.MultiplyApi.multiply', StandardMessageCodec());
    final Map<Object, Object> replyMap = await channel.send(encoded) as Map<Object, Object>;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object, Object> error = replyMap['error'] as Map<Object, Object>;
      throw PlatformException(
        code: error['code'] as String,
        message: error['message'] as String,
        details: error['details'],
      );
    } else {
      return MultiplyResult.decode(replyMap['result']);
    }
  }
}
