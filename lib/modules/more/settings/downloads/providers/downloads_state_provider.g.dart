// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnlyOnWifiState)
const onlyOnWifiStateProvider = OnlyOnWifiStateProvider._();

final class OnlyOnWifiStateProvider
    extends $NotifierProvider<OnlyOnWifiState, bool> {
  const OnlyOnWifiStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onlyOnWifiStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onlyOnWifiStateHash();

  @$internal
  @override
  OnlyOnWifiState create() => OnlyOnWifiState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$onlyOnWifiStateHash() => r'ea6df18bb5dc5019a00fca258d45cb0dfee0dffe';

abstract class _$OnlyOnWifiState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SaveAsCBZArchiveState)
const saveAsCBZArchiveStateProvider = SaveAsCBZArchiveStateProvider._();

final class SaveAsCBZArchiveStateProvider
    extends $NotifierProvider<SaveAsCBZArchiveState, bool> {
  const SaveAsCBZArchiveStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveAsCBZArchiveStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveAsCBZArchiveStateHash();

  @$internal
  @override
  SaveAsCBZArchiveState create() => SaveAsCBZArchiveState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$saveAsCBZArchiveStateHash() =>
    r'836e8cce08b3d307c58d2a850a7dcb3c9d739fc1';

abstract class _$SaveAsCBZArchiveState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DownloadLocationState)
const downloadLocationStateProvider = DownloadLocationStateProvider._();

final class DownloadLocationStateProvider
    extends $NotifierProvider<DownloadLocationState, (String, String)> {
  const DownloadLocationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadLocationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadLocationStateHash();

  @$internal
  @override
  DownloadLocationState create() => DownloadLocationState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((String, String) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(String, String)>(value),
    );
  }
}

String _$downloadLocationStateHash() =>
    r'75e2679930508fdd5e1b59baca632e03aace598e';

abstract class _$DownloadLocationState extends $Notifier<(String, String)> {
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

@ProviderFor(ConcurrentDownloadsState)
const concurrentDownloadsStateProvider = ConcurrentDownloadsStateProvider._();

final class ConcurrentDownloadsStateProvider
    extends $NotifierProvider<ConcurrentDownloadsState, int> {
  const ConcurrentDownloadsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'concurrentDownloadsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$concurrentDownloadsStateHash();

  @$internal
  @override
  ConcurrentDownloadsState create() => ConcurrentDownloadsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$concurrentDownloadsStateHash() =>
    r'295fe3f49224fd645b01f1aa89ba79dd330fffed';

abstract class _$ConcurrentDownloadsState extends $Notifier<int> {
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
