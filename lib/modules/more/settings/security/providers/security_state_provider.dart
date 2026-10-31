import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mangayomi/repositories/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'security_state_provider.g.dart';

const _appLockChannel = MethodChannel('com.kodjodevf.mangayomi.app_lock');

/// Tells iOS whether to cover the window with a blur while the app is not
/// active, so the app switcher snapshot doesn't reveal the content.
Future<void> syncAppLockPrivacyScreen(bool enabled) async {
  if (!Platform.isIOS) return;
  try {
    await _appLockChannel.invokeMethod('setPrivacyScreen', enabled);
  } catch (_) {}
}

@riverpod
class AppLockEnabledState extends _$AppLockEnabledState {
  @override
  bool build() {
    return settingsRepository.current.appLockEnabled ?? false;
  }

  void set(bool value) {
    state = value;
    settingsRepository.update((s) => s.appLockEnabled = value);
    syncAppLockPrivacyScreen(value);
  }
}

/// Tracks whether the app is currently unlocked.
/// Resets to false when app goes to background (if lock is enabled).
@riverpod
class AppUnlockedState extends _$AppUnlockedState {
  @override
  bool build() {
    // If app lock is not enabled, always unlocked
    final lockEnabled = settingsRepository.current.appLockEnabled ?? false;
    return !lockEnabled;
  }

  void unlock() => state = true;

  void lock() => state = false;
}
