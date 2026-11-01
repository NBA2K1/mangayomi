import 'package:flutter/material.dart';
import 'package:mangayomi/modules/widgets/progress_center.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// A single image the user can pinch-zoom. Tapping it closes the dialog or
/// route it is shown in.
class ZoomableImageView extends StatelessWidget {
  final ImageProvider imageProvider;
  const ZoomableImageView({super.key, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: PhotoViewGallery.builder(
        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: imageProvider,
            minScale: PhotoViewComputedScale.contained,
            maxScale: 2.0,
          );
        },
        loadingBuilder: (context, event) {
          return const ProgressCenter();
        },
      ),
    );
  }
}

/// Shows [imageProvider] full-screen in a dialog, zoomable, and closes on tap.
void showImagePreview(BuildContext context, ImageProvider imageProvider) {
  showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: ZoomableImageView(imageProvider: imageProvider),
      );
    },
  );
}
