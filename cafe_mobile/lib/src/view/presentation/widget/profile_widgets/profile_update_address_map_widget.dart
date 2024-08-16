
import 'package:cafe_mobile/src/core/utils/locaint_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class ProfileUpdateAddressMapWidget extends StatefulWidget {
  const ProfileUpdateAddressMapWidget({super.key});

  @override
  State<ProfileUpdateAddressMapWidget> createState() => _ProfileUpdateAddressMapWidgetState();
}
class _ProfileUpdateAddressMapWidgetState extends State<ProfileUpdateAddressMapWidget> {


  bool isLoading = false;
  final MapController controller = MapController();
  late LatLng latLng;

  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    isLoading = true;
    final getPosition = await LocationServie().getPosition(context);
    latLng = LatLng(getPosition.latitude, getPosition.longitude);
    isLoading = false;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
        ? const Center(child: CircularProgressIndicator(),)
        : FlutterMap(
          mapController: controller,
          options: MapOptions(
            onTap: (tapPosition, point) {
              final data = LatLng(point.latitude, point.longitude);
              setState(() => latLng = data);
            },
            initialCenter: latLng ,
            initialZoom: 13
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.cafe_mobile',
              maxNativeZoom: 12,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: latLng , 
                  child: Icon(Icons.location_on_rounded,color: Theme.of(context).primaryColor, size: 40,))
              ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.check),
                  onPressed: ()async{
                    print(latLng.latitude);
                    print(latLng.longitude);
                    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
                    print(placemarks.toString());
                    print(placemarks.length.toString());
                    // for(var i in placemarks)log(i.street ?? '');
                  }),
              ),
            )
      ])
    );
  }
}