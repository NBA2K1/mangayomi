import 'dart:io';

/// macOS, Linux or Windows
final bool isDesktop = isMacOS || isNonMacDesktop;

/// Android or iOS
final bool isMobile = isAndroid || isIOS;

/// macOS or iOS
final bool isApple = isMacOS || isIOS;

/// Windows or Linux
final bool isNonMacDesktop = isLinux || isWindows;

final bool isIOS = Platform.isIOS;

final bool isMacOS = Platform.isMacOS;

final bool isLinux = Platform.isLinux;

final bool isWindows = Platform.isWindows;

final bool isAndroid = Platform.isAndroid;
