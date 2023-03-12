import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';
import 'dart:ui' as ui;


class MapScreen extends StatefulWidget {
  MapScreen({Key? key, required this.latititue, required this.lan});
  final String latititue;
  final String lan;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition? kgooglePlex;
  Marker? marker;
  Uint8List? markerIcon;

  @override
  void initState() {
    super.initState();
    kgooglePlex = CameraPosition(
      target: LatLng(
        double.parse(widget.latititue),
        double.parse(widget.lan),
      ),
      zoom: 24,
    );
  }

  Future<void> MarkerIcon() async {
    markerIcon = await getBytesFromAssets(FilePath.markerIcon, 70);
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MarkerIcon(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          return GoogleMap(
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            markers: Set<Marker>.of({
              Marker(
                markerId: const MarkerId(
                  // i.toString(),
                  '1234',
                ),
                icon: BitmapDescriptor.fromBytes(
                  markerIcon!,
                ),
                infoWindow: InfoWindow(onTap: () => {}),
                position: LatLng(
                  double.parse(widget.latititue),
                  double.parse(widget.lan),
                ),
              ),
            }),
            initialCameraPosition: kgooglePlex!,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );
        });
  }
}
