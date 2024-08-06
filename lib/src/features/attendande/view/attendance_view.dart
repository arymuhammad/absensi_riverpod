import 'package:absensi_riverpod/core/config/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:latlong2/latlong.dart';

class AttendanceView extends ConsumerWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
            // appBar: AppBar(
            //   title: Text(
            //     'ABSEN',
            //     // data![9] == "26" ? 'VISIT' : 'ABSEN',
            //     style:  TextStyle(color: white),
            //   ),
            //   automaticallyImplyLeading: false,
            //   centerTitle: true,
            //   flexibleSpace: Container(
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //             'assets/image/bgapp.jpg'), // Gantilah dengan path gambar Anda
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            body: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                      initialCenter: LatLng(
                          51.519475, 7.46694444),
                      initialZoom: 17,
                      maxZoom: 18.4,
                      minZoom: 17),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    CircleLayer(
                      circles: [
                        CircleMarker(
                            point: LatLng(
                              51.519475, 7.46694444),
                            radius: 100,
                            useRadiusInMeter: true,
                            color: const Color.fromARGB(71, 16, 134, 230),
                            borderStrokeWidth: 2,
                            borderColor: const Color.fromARGB(66, 4, 97, 173)),
                      ],
                    ),
                    CurrentLocationLayer(
                      alignPositionOnUpdate: AlignOnUpdate.always,
                      alignDirectionOnUpdate: AlignOnUpdate.never,
                      style: const LocationMarkerStyle(
                        marker: DefaultLocationMarker(
                          child: Icon(
                            Icons.navigation,
                            color: Colors.white,
                          ),
                        ),
                        markerSize: Size(40, 40),
                        markerDirection: MarkerDirection.heading,
                      ),
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () {},
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 28, // Mengatur posisi di bagian bawah
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.map_1_bold,
                              color: Colors.blueAccent[700],
                              size: 80,
                            ),
                            // Obx(() => Text(absenC.lokasi.value)),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}