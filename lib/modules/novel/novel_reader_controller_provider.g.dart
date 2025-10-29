// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_reader_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NovelReaderController)
const novelReaderControllerProvider = NovelReaderControllerFamily._();

final class NovelReaderControllerProvider
    extends $NotifierProvider<NovelReaderController, void> {
  const NovelReaderControllerProvider._({
    required NovelReaderControllerFamily super.from,
    required Chapter super.argument,
  }) : super(
         retry: null,
         name: r'novelReaderControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$novelReaderControllerHash();

  @override
  String toString() {
    return r'novelReaderControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NovelReaderController create() => NovelReaderController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NovelReaderControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$novelReaderControllerHash() =>
    r'47354aa64609d94a875d58569b5c95257b736b76';

final class NovelReaderControllerFamily extends $Family
    with
        $ClassFamilyOverride<NovelReaderController, void, void, void, Chapter> {
  const NovelReaderControllerFamily._()
    : super(
        retry: null,
        name: r'novelReaderControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NovelReaderControllerProvider call({required Chapter chapter}) =>
      NovelReaderControllerProvider._(argument: chapter, from: this);

  @override
  String toString() => r'novelReaderControllerProvider';
}

abstract class _$NovelReaderController extends $Notifier<void> {
  late final _$args = ref.$arg as Chapter;
  Chapter get chapter => _$args;

  void build({required Chapter chapter});
  @$mustCallSuper
  @override
  void runBuild() {
    build(chapter: _$args);
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
