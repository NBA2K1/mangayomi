// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(doBackUp)
const doBackUpProvider = DoBackUpFamily._();

final class DoBackUpProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DoBackUpProvider._({
    required DoBackUpFamily super.from,
    required ({List<int> list, String path, BuildContext? context})
    super.argument,
  }) : super(
         retry: null,
         name: r'doBackUpProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$doBackUpHash();

  @override
  String toString() {
    return r'doBackUpProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as ({List<int> list, String path, BuildContext? context});
    return doBackUp(
      ref,
      list: argument.list,
      path: argument.path,
      context: argument.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DoBackUpProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$doBackUpHash() => r'd16d5b6e5ed2c20988fa2d49842524d70ac0ed0d';

final class DoBackUpFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({List<int> list, String path, BuildContext? context})
        > {
  const DoBackUpFamily._()
    : super(
        retry: null,
        name: r'doBackUpProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DoBackUpProvider call({
    required List<int> list,
    required String path,
    required BuildContext? context,
  }) => DoBackUpProvider._(
    argument: (list: list, path: path, context: context),
    from: this,
  );

  @override
  String toString() => r'doBackUpProvider';
}
