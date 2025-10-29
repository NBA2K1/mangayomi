// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_backup.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BackupFrequencyState)
const backupFrequencyStateProvider = BackupFrequencyStateProvider._();

final class BackupFrequencyStateProvider
    extends $NotifierProvider<BackupFrequencyState, int> {
  const BackupFrequencyStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backupFrequencyStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backupFrequencyStateHash();

  @$internal
  @override
  BackupFrequencyState create() => BackupFrequencyState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$backupFrequencyStateHash() =>
    r'2e73e3fe54456978ff92f49cdc67e84f2af6de7c';

abstract class _$BackupFrequencyState extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BackupFrequencyOptionsState)
const backupFrequencyOptionsStateProvider =
    BackupFrequencyOptionsStateProvider._();

final class BackupFrequencyOptionsStateProvider
    extends $NotifierProvider<BackupFrequencyOptionsState, List<int>> {
  const BackupFrequencyOptionsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backupFrequencyOptionsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backupFrequencyOptionsStateHash();

  @$internal
  @override
  BackupFrequencyOptionsState create() => BackupFrequencyOptionsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }
}

String _$backupFrequencyOptionsStateHash() =>
    r'9aa31bef65e0e2f20b306ed17ff058df2f24a635';

abstract class _$BackupFrequencyOptionsState extends $Notifier<List<int>> {
  List<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<int>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<int>, List<int>>,
              List<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AutoBackupLocationState)
const autoBackupLocationStateProvider = AutoBackupLocationStateProvider._();

final class AutoBackupLocationStateProvider
    extends $NotifierProvider<AutoBackupLocationState, (String, String)> {
  const AutoBackupLocationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoBackupLocationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoBackupLocationStateHash();

  @$internal
  @override
  AutoBackupLocationState create() => AutoBackupLocationState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((String, String) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(String, String)>(value),
    );
  }
}

String _$autoBackupLocationStateHash() =>
    r'45e1942f6f88ccb92f3f96ddfb5c74df477b61ba';

abstract class _$AutoBackupLocationState extends $Notifier<(String, String)> {
  (String, String) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<(String, String), (String, String)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(String, String), (String, String)>,
              (String, String),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(checkAndBackup)
const checkAndBackupProvider = CheckAndBackupProvider._();

final class CheckAndBackupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CheckAndBackupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkAndBackupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkAndBackupHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return checkAndBackup(ref);
  }
}

String _$checkAndBackupHash() => r'c3fa9f0b0f9009088ee8e787407a691b0044901f';
