// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDetail)
const getDetailProvider = GetDetailFamily._();

final class GetDetailProvider
    extends $FunctionalProvider<AsyncValue<MManga>, MManga, FutureOr<MManga>>
    with $FutureModifier<MManga>, $FutureProvider<MManga> {
  const GetDetailProvider._({
    required GetDetailFamily super.from,
    required ({String url, Source source}) super.argument,
  }) : super(
         retry: null,
         name: r'getDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDetailHash();

  @override
  String toString() {
    return r'getDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<MManga> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MManga> create(Ref ref) {
    final argument = this.argument as ({String url, Source source});
    return getDetail(ref, url: argument.url, source: argument.source);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDetailHash() => r'6b758b79281cb00a7df2fe1903d4a67068052bca';

final class GetDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<MManga>,
          ({String url, Source source})
        > {
  const GetDetailFamily._()
    : super(
        retry: null,
        name: r'getDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDetailProvider call({required String url, required Source source}) =>
      GetDetailProvider._(argument: (url: url, source: source), from: this);

  @override
  String toString() => r'getDetailProvider';
}
