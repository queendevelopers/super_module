import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_module/src/core/utils/dialog_utils.dart';

class AppImageProvider {
  File? file;
  final ImagePicker _picker = ImagePicker();

  Future<File?> showAppImagePicker({required BuildContext context}) async {
    await showModalBottomSheet<File>(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          return Wrap(
            children: [
              SafeArea(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                      trailing: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                      onTap: () async {
                        file = await appImagePick(
                            source: ImageSource.camera, context: context);
                      }),
                  ListTile(
                      trailing: Icon(Icons.image),
                      title: Text('Gallery'),
                      onTap: () async {
                        file = await appImagePick(
                            source: ImageSource.gallery, context: context);
                      })
                ],
              ))
            ],
          );
        });

    return file;
  }

  appImagePick(
      {ImageSource source = ImageSource.gallery,
      required BuildContext context}) async {
    final isPermissionGranted = source == ImageSource.camera
        ? await Permission.camera.isGranted
        : (await Permission.photos.isGranted ||
            await Permission.photos.isLimited);

    debugPrint(isPermissionGranted.toString());

    Permission.photos.status
        .then((value) => debugPrint(' photos permission ${value.toString()}'));
    Permission.camera.status
        .then((value) => debugPrint(' camera permission ${value.toString()}'));

    if (Platform.isAndroid) {
      if (!isPermissionGranted) {
        if (source == ImageSource.camera) {
          await Permission.camera.request();
          if (await Permission.camera.isPermanentlyDenied ||
              await Permission.camera.isDenied) {
            showPermissionDialog('camera', context);
          }
        } else if (source == ImageSource.gallery) {
          await Permission.photos.request();

          if (await Permission.photos.isPermanentlyDenied ||
              await Permission.photos.isDenied) {
            showPermissionDialog('photos', context);
          }
        }
      }
    } else if (Platform.isIOS) {
      if (source == ImageSource.camera) {
        await Permission.camera.request();
        if (await Permission.camera.isPermanentlyDenied ||
            await Permission.camera.isDenied ||
            await Permission.camera.isRestricted) {
          showPermissionDialog('camera', context);
        }
      } else if (source == ImageSource.gallery) {
        await Permission.photos.request();

        if (await Permission.photos.isPermanentlyDenied ||
            await Permission.photos.isDenied ||
            await Permission.photos.isRestricted) {
          showPermissionDialog('photos', context);
        }
      }
    }

    if (isPermissionGranted) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        file = File(pickedFile.path);
      }
      Navigator.of(context).pop();
    }

    return file;
  }

  showPermissionDialog(String typeOfPermission, BuildContext context) {
    showAlertDialog(
        context: context,
        title: 'Permission needed',
        okBtnHandler: () {
          Navigator.pop(context);
          Navigator.pop(context);
          openAppSettings();
        },
        message: 'Give $typeOfPermission permission from settings');
  }
}
