import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PlatformRepository {
  static const platform = MethodChannel('flutter.native/helper');

  Future<String> changeColor(String color) async {
    try {
      final String result =
          await platform.invokeMethod('changeColor', {'color': color});
      debugPrint('result is $result');
      color = result;
    } on PlatformException catch (e) {
      debugPrint('on platform exception catch $e');
    }
    return color;
  }
}
