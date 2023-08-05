// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition initialPoint = CameraPosition(
      target: scan.getLatLg(),
      zoom: 17,
    );

    // Marcadores
    Set<Marker> markers = <Marker>{};

    markers.add(
      Marker(
          markerId: const MarkerId('geo-location'), position: scan.getLatLg()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;

                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: scan.getLatLg())));
              },
              icon: const Icon(
                Icons.location_pin,
                color: Colors.white,
              ))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: initialPoint,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }

          setState(() {});
        },
      ),
    );
  }
}
