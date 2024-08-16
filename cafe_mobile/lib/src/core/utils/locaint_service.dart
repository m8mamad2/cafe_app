import 'package:cafe_mobile/src/core/utils/error_dialog.dart';
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

}