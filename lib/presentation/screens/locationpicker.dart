import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/presentation/screens/conifrmOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapPickerScreen extends StatefulWidget {
  @override
  _MapPickerScreenState createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng _pickedLocation = const LatLng(33.5138, 36.2765);
  final MapController _mapController = MapController();
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Your Address",
          style: TextStyle(
              fontSize: 24, color: fourColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _pickedLocation,
              initialZoom: 15.0,
              onTap: (tapPosition, latLng) {
                setState(() {
                  _pickedLocation = latLng;
                });
              },
            ),
            children: [
              // طبقة الخريطة (من OpenStreetMap)
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName:
                    'com.clickresturant.app', // اسم الباكج الخاص بك
              ),
              // طبقة المؤشر (Marker)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _pickedLocation,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () async {
                  _getCurrentLocation();
                  await saveLocationLocally(
                    _pickedLocation.latitude,
                    _pickedLocation.longitude,
                  );

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Conifrmorder()));
                },
                child: const Text(
                  "Confirm Location",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    // طلب الإذن
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _pickedLocation = LatLng(position.latitude, position.longitude);
    });

    _mapController.move(_pickedLocation, 15);
  }

  Future<void> saveLocationLocally(double lat, double lng) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('lat', lat);
    await prefs.setDouble('lng', lng);
  }
}
