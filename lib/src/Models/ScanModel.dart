// ignore_for_file: prefer_initializing_formals, file_names

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

enum ScanType {
  https,
  geo,
}

class ScanModel {
  ScanModel({
    int? id, // Add appropriate data types for 'id'.
    this.type = ScanType.https, // Set default value to 'https'.
    required this.value,
  }) : id = id;

  int? id;
  ScanType type;
  String value;

  LatLng getLatLg() {
    final latLng = value.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"] == "https" ? ScanType.https : ScanType.geo,
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type == ScanType.https ? "https" : "geo",
        "value": value,
      };
}
