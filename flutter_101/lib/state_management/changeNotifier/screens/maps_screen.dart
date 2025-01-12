import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; // Add this for location functionality

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final Set<Marker> _markers = {}; // To store custom markers
  LocationData? _currentLocation; // To hold the user's current location
  late Location _location; // Location instance

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _location = Location();
    _getCurrentLocation(); // Fetch user's current location on startup
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _currentLocation = locationData;
      });

      if (locationData != null) {
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(locationData.latitude!, locationData.longitude!),
              zoom: 15.0,
            ),
          ),
        );

        // Add a marker for the user's location
        _markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(locationData.latitude!, locationData.longitude!),
            infoWindow: const InfoWindow(title: 'You are here'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error fetching location: $e');
    }
  }

  void _addCustomMarker(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(title: 'Custom Marker', snippet: position.toString()),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _addCustomMarker, // Add a custom marker on tap
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getCurrentLocation,
        label: const Text('Current Location'),
        icon: const Icon(Icons.my_location),
      ),
    );
  }
}
