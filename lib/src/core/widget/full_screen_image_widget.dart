import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageView extends StatelessWidget {
  final List<String> images;
  final int index;
  final String? authToken;
  final String title;

  FullScreenImageView(
      {required this.images,
      required this.index,
      this.authToken,
      this.title = 'Fullscreen Image'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
          child: ScrollConfiguration(
        behavior: MaterialScrollBehavior(),
        child: PhotoViewGallery.builder(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(images[index],
                  headers: authToken != null
                      ? {
                          'Authorization': 'Bearer $authToken',
                        }
                      : {}),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
            );
          },
          itemCount: images.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          pageController: PageController(initialPage: index),
        ),
      )),
    );
  }

/*   PhotoView(
        imageProvider: _imageProvider,
        minScale: PhotoViewComputedScale.contained,
      ),);*/

}
