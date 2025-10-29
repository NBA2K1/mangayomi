// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_borders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cropBorders)
const cropBordersProvider = CropBordersFamily._();

final class CropBordersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
  const CropBordersProvider._({
    required CropBordersFamily super.from,
    required ({UChapDataPreload data, bool cropBorder}) super.argument,
  }) : super(
         retry: null,
         name: r'cropBordersProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cropBordersHash();

  @override
  String toString() {
    return r'cropBordersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
    final argument =
        this.argument as ({UChapDataPreload data, bool cropBorder});
    return cropBorders(
      ref,
      data: argument.data,
      cropBorder: argument.cropBorder,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CropBordersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cropBordersHash() => r'04b24357737d6cc75caa38feca77bb5d41f00aa6';

final class CropBordersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Uint8List?>,
          ({UChapDataPreload data, bool cropBorder})
        > {
  const CropBordersFamily._()
    : super(
        retry: null,
        name: r'cropBordersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CropBordersProvider call({
    required UChapDataPreload data,
    required bool cropBorder,
  }) => CropBordersProvider._(
    argument: (data: data, cropBorder: cropBorder),
    from: this,
  );

  @override
  String toString() => r'cropBordersProvider';
}
