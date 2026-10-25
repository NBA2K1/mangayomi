import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;

/// True when neither `mpv.conf` nor `input.conf` exists in [dir], meaning the
/// bundled mpv config has never been installed there.
Future<bool> isMpvConfigMissing(Directory dir) async {
  final exists = await Future.wait([
    File(p.join(dir.path, 'mpv.conf')).exists(),
    File(p.join(dir.path, 'input.conf')).exists(),
  ]);
  return !exists[0] && !exists[1];
}

/// Extracts the bundled mpv config (`mpv.conf`, `input.conf`, shaders and
/// scripts) into [dir], overwriting files that already exist. All files are
/// written in parallel.
///
/// Resolving [dir] (and any storage permission) is the caller's job.
Future<void> installMpvConfig(Directory dir) async {
  final bytes = await rootBundle.load('assets/mangayomi_mpv.zip');
  final archive = ZipDecoder().decodeBytes(bytes.buffer.asUint8List());
  final shadersDir = Directory(p.join(dir.path, 'shaders'));
  final scriptsDir = Directory(p.join(dir.path, 'scripts'));
  await Future.wait([
    shadersDir.create(recursive: true),
    scriptsDir.create(recursive: true),
  ]);

  final writes = <Future<Object?>>[];
  for (final file in archive.files) {
    final name = file.name;
    if (name == 'mpv.conf' || name == 'input.conf') {
      writes.add(File(p.join(dir.path, name)).writeAsBytes(file.content));
    } else if (name.startsWith('shaders/') && name.endsWith('.glsl')) {
      final shaderFile = File(p.join(shadersDir.path, p.basename(name)));
      writes.add(shaderFile.writeAsBytes(file.content));
    } else if (name.startsWith('scripts/') &&
        (name.endsWith('.js') || name.endsWith('.lua'))) {
      final scriptFile = File(p.join(scriptsDir.path, p.basename(name)));
      writes.add(scriptFile.writeAsBytes(file.content));
    }
  }
  await Future.wait(writes);
}
