// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_video_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getVideoList)
const getVideoListProvider = GetVideoListFamily._();

final class GetVideoListProvider
    extends
        $FunctionalProvider<
          AsyncValue<(List<Video>, bool, List<String>, Directory?)>,
          (List<Video>, bool, List<String>, Directory?),
          FutureOr<(List<Video>, bool, List<String>, Directory?)>
        >
    with
        $FutureModifier<(List<Video>, bool, List<String>, Directory?)>,
        $FutureProvider<(List<Video>, bool, List<String>, Directory?)> {
  const GetVideoListProvider._({
    required GetVideoListFamily super.from,
    required Chapter super.argument,
  }) : super(
         retry: null,
         name: r'getVideoListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getVideoListHash();

  @override
  String toString() {
    return r'getVideoListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(List<Video>, bool, List<String>, Directory?)>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<(List<Video>, bool, List<String>, Directory?)> create(Ref ref) {
    final argument = this.argument as Chapter;
    return getVideoList(ref, episode: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVideoListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getVideoListHash() => r'c54f7294e15eeede933a6e04cd9b761d82b5f74c';

final class GetVideoListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<(List<Video>, bool, List<String>, Directory?)>,
          Chapter
        > {
  const GetVideoListFamily._()
    : super(
        retry: null,
        name: r'getVideoListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetVideoListProvider call({required Chapter episode}) =>
      GetVideoListProvider._(argument: episode, from: this);

  @override
  String toString() => r'getVideoListProvider';
}
