import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get allInCaps => this.toUpperCase();

  String capitalizeFirstofEach() => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

extension FunctionExtension on Function {
  Function execute(BuildContext context, Function function) {
    FocusScope.of(context).unfocus();
    return function;
  }
}

extension ImageCompression on File {
  Future<File?> compressFile({int quality = 80, int rotation = 0}) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      this.absolute.path,
      (await path_provider.getTemporaryDirectory()).absolute.path + 'temp.jpg',
      quality: quality,
      rotate: rotation,
    );

    debugPrint(this.lengthSync().toString());
    return File(result!.path);
  }

  Future<Uint8List?> compressToUint8List(
      {int quality = 50, int rotation = 0}) async {
    var result = await FlutterImageCompress.compressWithFile(
      this.absolute.path,
      quality: quality,
      rotate: rotation,
    );

    debugPrint(this.lengthSync().toString());

    return result;
  }
}
