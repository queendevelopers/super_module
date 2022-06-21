import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_module/src/core/service/remote_config/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/core/utils/app_launchers.dart';

Future<void> checkForUpdates(
    {required BuildContext context,
    required FirebaseRemoteConfigModel firebaseRemoteConfigModel,
    String locale = 'en'}) async {
  if (firebaseRemoteConfigModel.isEnabled) {
    AlertDialog(
      title: Text(
        firebaseRemoteConfigModel.title.titleText[locale],
      ),
      content: Text(
        firebaseRemoteConfigModel.description.descriptionText[locale],
      ),
      actions: [
        TextButton(
            onPressed: () => AppLaunchers()
                .launchURL(getStoreUrl(firebaseRemoteConfigModel)),
            child:
                Text(firebaseRemoteConfigModel.button.yesButtonText[locale])),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(firebaseRemoteConfigModel.button.noButtonText[locale])),
      ],
    );
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
