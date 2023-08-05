// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Future<void> canLaunchUrl(
      Uri url, ScanType type, context, ScanModel scan) async {
    final typeString = type.toString();

    if (typeString.split('.').last == 'https') {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else {
      Navigator.pushNamed(context, 'map', arguments: scan);
    }
  }
}
