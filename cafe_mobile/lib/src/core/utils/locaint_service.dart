import 'dart:async';

import 'package:cafe_mobile/src/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationServie{

  Future<Position> getPosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await errorDialog(context, "Plese Enable Location Service");
    };

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await errorDialog(context, "please Give Location Access");
      }
        
    }
    
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Stream<Position> currentPostionStream(){
    final LocationSettings locationSettings = LocationSettings( accuracy: LocationAccuracy.high, distanceFilter: 100, );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
    // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings)
    // .listen(
    // (Position? position) {
    //     print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    // });
  }
}