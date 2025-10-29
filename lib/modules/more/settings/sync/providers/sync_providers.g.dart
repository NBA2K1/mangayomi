// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Synching)
const synchingProvider = SynchingFamily._();

final class SynchingProvider
    extends $NotifierProvider<Synching, SyncPreference> {
  const SynchingProvider._({
    required SynchingFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'synchingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$synchingHash();

  @override
  String toString() {
    return r'synchingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Synching create() => Synching();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncPreference value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncPreference>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SynchingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$synchingHash() => r'b8ae212a8874cf9a170b71d05a91350849a824d1';

final class SynchingFamily extends $Family
    with
        $ClassFamilyOverride<
          Synching,
          SyncPreference,
          SyncPreference,
          SyncPreference,
          int?
        > {
  const SynchingFamily._()
    : super(
        retry: null,
        name: r'synchingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SynchingProvider call({required int? syncId}) =>
      SynchingProvider._(argument: syncId, from: this);

  @override
  String toString() => r'synchingProvider';
}

abstract class _$Synching extends $Notifier<SyncPreference> {
  late final _$args = ref.$arg as int?;
  int? get syncId => _$args;

  SyncPreference build({required int? syncId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(syncId: _$args);
    final ref = this.ref as $Ref<SyncPreference, SyncPreference>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SyncPreference, SyncPreference>,
              SyncPreference,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
