import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:super_module/src/core/utils/app_launchers.dart';
import 'package:super_module/src/core/utils/dialog_utils.dart';
import 'package:super_module/src/features/remote_config/data/models/firebase_remote_config_model.dart';

Future<void> checkForUpdates(
    {required BuildContext context,
    required FirebaseRemoteConfigModel firebaseRemoteConfigModel,
    String locale = 'en'}) async {
  if (firebaseRemoteConfigModel.isEnabled) {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (int.parse(packageInfo.buildNumber) <
        int.parse(firebaseRemoteConfigModel.minimumVersion)) {
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
    } else if (int.parse(packageInfo.buildNumber) <
        int.parse(firebaseRemoteConfigModel.latestVersion)) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => AlertDialog(
                title: Text(
                  firebaseRemoteConfigModel.title.titleText[locale],
                ),
                content: Column(
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
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(firebaseRemoteConfigModel
                          .button.noButtonText[locale])),
                ],
              ));
    }
  }
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
