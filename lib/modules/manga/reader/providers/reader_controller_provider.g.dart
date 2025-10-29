// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentIndex)
const currentIndexProvider = CurrentIndexFamily._();

final class CurrentIndexProvider extends $NotifierProvider<CurrentIndex, int> {
  const CurrentIndexProvider._({
    required CurrentIndexFamily super.from,
    required Chapter super.argument,
  }) : super(
         retry: null,
         name: r'currentIndexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentIndexHash();

  @override
  String toString() {
    return r'currentIndexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CurrentIndex create() => CurrentIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentIndexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentIndexHash() => r'e0b5e5b8a2afa5e8df699784009720334e1c9e80';

final class CurrentIndexFamily extends $Family
    with $ClassFamilyOverride<CurrentIndex, int, int, int, Chapter> {
  const CurrentIndexFamily._()
    : super(
        retry: null,
        name: r'currentIndexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CurrentIndexProvider call(Chapter chapter) =>
      CurrentIndexProvider._(argument: chapter, from: this);

  @override
  String toString() => r'currentIndexProvider';
}

abstract class _$CurrentIndex extends $Notifier<int> {
  late final _$args = ref.$arg as Chapter;
  Chapter get chapter => _$args;

  int build(Chapter chapter);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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

@ProviderFor(ReaderController)
const readerControllerProvider = ReaderControllerFamily._();

final class ReaderControllerProvider
    extends $NotifierProvider<ReaderController, KeepAliveLink> {
  const ReaderControllerProvider._({
    required ReaderControllerFamily super.from,
    required Chapter super.argument,
  }) : super(
         retry: null,
         name: r'readerControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$readerControllerHash();

  @override
  String toString() {
    return r'readerControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReaderController create() => ReaderController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeepAliveLink value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeepAliveLink>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReaderControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$readerControllerHash() => r'25b13bbbbd961a5c3dbae3cc0ea58017d7bb5ce8';

final class ReaderControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ReaderController,
          KeepAliveLink,
          KeepAliveLink,
          KeepAliveLink,
          Chapter
        > {
  const ReaderControllerFamily._()
    : super(
        retry: null,
        name: r'readerControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReaderControllerProvider call({required Chapter chapter}) =>
      ReaderControllerProvider._(argument: chapter, from: this);

  @override
  String toString() => r'readerControllerProvider';
}

abstract class _$ReaderController extends $Notifier<KeepAliveLink> {
  late final _$args = ref.$arg as Chapter;
  Chapter get chapter => _$args;

  KeepAliveLink build({required Chapter chapter});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(chapter: _$args);
    final ref = this.ref as $Ref<KeepAliveLink, KeepAliveLink>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KeepAliveLink, KeepAliveLink>,
              KeepAliveLink,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
