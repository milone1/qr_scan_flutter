// import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

// ignore_for_file: file_names

class ScanModel {
  ScanModel({
    id,
    type,
    required value,
  }) {
    if (this.value.contains('http')) {
      this.type = 'http';
    } else {
      this.type = 'geo';
    }
  }

  late int id;
  late String type;
  late String value;

  // LatLng getLatLng() {

  //   final latLng = this.valor.substring(4).split(',');
  //   final lat = double.parse( latLng[0] );
  //   final lng = double.parse( latLng[1] );

  //   return LatLng( lat, lng );
  // }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
