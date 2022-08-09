import 'dart:io';

import 'package:flutter/material.dart';
import 'package:super_module/src/core/utils/app_launchers.dart';
import 'package:super_module/src/core/utils/dialog_utils.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_remote_config_model.dart';

void checkForUpdates(
    {required BuildContext context,
    required FirebaseRemoteConfigModel firebaseRemoteConfigModel,
    String locale = 'en',
    required String currentAppVersion,
    VoidCallback? onNoPressed}) {
  /*
  Check if show alert dialog feature is enabled
   */
  if (firebaseRemoteConfigModel.isEnabled)
  /*
    Check if current version is less than the minimum version specified in firebaseRemoteConfig.
     */
  if (int.parse(currentAppVersion.replaceAll(".", "")) <
      int.parse(firebaseRemoteConfigModel.minimumVersion.replaceAll(".", ""))) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                firebaseRemoteConfigModel.title.forceTitleText[locale],
              ),
              content: Text(
                firebaseRemoteConfigModel
                    .description.forceDescriptionText[locale],
              ),
              actions: [
                TextButton(
                    onPressed: () => AppLaunchers()
                        .launchURL(getStoreUrl(firebaseRemoteConfigModel)),
                    child: Text(firebaseRemoteConfigModel
                        .button.yesButtonText[locale])),
              ],
            ));
    /*
    Check if current version is less than the latest version
    but greater than the minimum version specified in firebaseRemoteConfig.
     */
  } else if (int.parse(currentAppVersion.replaceAll(".", "")) <
      int.parse(firebaseRemoteConfigModel.latestVersion.replaceAll(".", ""))) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Text(
                firebaseRemoteConfigModel.title.titleText[locale],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    firebaseRemoteConfigModel
                        .description.descriptionText[locale],
                  ),
                  Visibility(
                      visible:
                          firebaseRemoteConfigModel.releaseNotes.isNotEmpty,
                      child: TextButton(
                          onPressed: () {
                            showAlertDialog(
                                context: context,
                                title: 'Release Notes',
                                message: firebaseRemoteConfigModel
                                    .releaseNotes[locale],
                                okBtnHandler: () {
                                  Navigator.of(context).pop();
                                });
                          },
                          child: Text(
                            'Read Release Notes',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => AppLaunchers()
                        .launchURL(getStoreUrl(firebaseRemoteConfigModel)),
                    child: Text(firebaseRemoteConfigModel
                        .button.yesButtonText[locale])),
                TextButton(
                    onPressed: onNoPressed,
                    child: Text(
                        firebaseRemoteConfigModel.button.noButtonText[locale])),
              ],
            ));
  }
}

bool shouldShowUpdate(
    {required String currentAppVersion,
    required FirebaseRemoteConfigModel firebaseRemoteConfigModel}) {
  if (!firebaseRemoteConfigModel.isEnabled) {
    return false;
  } else if (int.parse(currentAppVersion.replaceAll(".", "")) <
      int.parse(firebaseRemoteConfigModel.minimumVersion.replaceAll(".", ""))) {
    return true;
  } else if (int.parse(currentAppVersion.replaceAll(".", "")) <
      int.parse(firebaseRemoteConfigModel.latestVersion.replaceAll(".", ""))) {
    return true;
  }
  return false;
}

String getStoreUrl(FirebaseRemoteConfigModel firebaseRemoteConfigModel) {
  if (Platform.isIOS) {
    return firebaseRemoteConfigModel.redirect.appStoreUrl;
  } else if (Platform.isAndroid) {
    return firebaseRemoteConfigModel.redirect.playStoreUrl;
  } else if (Platform.isWindows) {
    return firebaseRemoteConfigModel.redirect.microsoftStoreUrl;
  } else if (Platform.isLinux) {
    return firebaseRemoteConfigModel.redirect.linuxStoreUrl;
  } else if (Platform.isMacOS) {
    return firebaseRemoteConfigModel.redirect.macOSStoreUrl;
  } else {
    return firebaseRemoteConfigModel.redirect.otherStoreUrl;
  }
}
