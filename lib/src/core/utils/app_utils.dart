import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

String convertWhiteSpaceUrl(String text) {
  return text.replaceAll(' ', '%20');
}

Future<File> findCachedImagePath(String imageUrl) async {
  final cache = DefaultCacheManager();
  final file = await cache.getSingleFile(imageUrl);
  return file;
}
