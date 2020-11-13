import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apk_installed/apk_installed.dart';

void main() {
  const MethodChannel channel = MethodChannel('apk_installed');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
  });
}
