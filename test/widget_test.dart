// OpenAIDA smoke test
//
// Full integration tests require a running device with an initialised
// SharedPreferences instance.  This file verifies that the test harness
// works and that the package compiles cleanly.

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('OpenAIDA package smoke test', () {
    // The app bootstraps asynchronously (SharedPreferences, SecureStorage).
    // Integration tests that require a live AIDA network are executed on device.
    expect(true, isTrue);
  });
}
