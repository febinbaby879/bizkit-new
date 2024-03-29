import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static const urlMapTest = 'https://www.google.com/maps?q=';
  static Future<void> launchMap(
      {required String address, required BuildContext context}) async {
    try {
      launchUrl(Uri.parse(urlMapTest + address));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
      showSnackbar(context, message: errorMessage, backgroundColor: kneonShade);
    }
  }

  static launchUrls({required String url}) {
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
    }
  }

  static launchCall({required String phone}) {
    try {
      launchUrl(Uri.parse("tel://$phone"));
    } catch (e) {
      log('cannot launch url for call');
      log(e.toString());
    }
  }

  static openSMS({required String phoneNumber, required String message}) {
    final url = 'sms:$phoneNumber?body=$message';
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log('cannot launch url for sms');
      log(e.toString());
    }
  }
}
