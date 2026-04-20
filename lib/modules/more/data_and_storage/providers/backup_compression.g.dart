// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_compression.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BackupCompressionLevel)
final backupCompressionLevelProvider = BackupCompressionLevelProvider._();

final class BackupCompressionLevelProvider
    extends $NotifierProvider<BackupCompressionLevel, int> {
  BackupCompressionLevelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backupCompressionLevelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backupCompressionLevelHash();

  @$internal
  @override
  BackupCompressionLevel create() => BackupCompressionLevel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$backupCompressionLevelHash() =>
    r'46ac8540f51c50d3d426a6b78dc582b71bcd9bd9';

abstract class _$BackupCompressionLevel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
