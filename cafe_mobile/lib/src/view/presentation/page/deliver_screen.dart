import 'package:cafe_mobile/src/core/data_source/remote/web_scoket/deliver_web_socket.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/locatino_map_shimmer.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/data_source/remote/api_configure.dart';

class DeliverScreen extends StatefulWidget {
  const DeliverScreen({super.key});

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}
class _DeliverScreenState extends State<DeliverScreen> {

  
  final MapController controller = MapController();
  final DeliverWebSocket socketController = DeliverWebSocket();
  
  bool isLoading = true;
  late LatLng latLng2;

  List<Marker> markes = [];
  List<Marker> initMarkes = [];
  List<LatLng> routePoints = [];


  @override
  void initState() {
    super.initState();
    socketController.connecte();
    socketController.initLocationController.stream.listen((e){

      markes.add(Marker(point: LatLng(e.deliver_init_point.lat, e.deliver_init_point.lon), child: Image.asset('assets/car.png')));
      initMarkes.addAll([
        Marker(point: LatLng(e.start_point.first, e.start_point.last), child: Image.asset('assets/cafe.png')),
        Marker(point: LatLng(e.end_point.isEmpty ? 33.9876533 :  e.end_point.first , e.end_point.isEmpty ? 51.4428856 : e.end_point.last ), child: Image.asset('assets/home.png')),
      ]);
      _getRoute(
        e.start_point.first, 
        e.start_point.last, 
        e.end_point.isEmpty ? 33.9876533 :  e.end_point.first ,
        e.end_point.isEmpty ? 51.4428856 : e.end_point.last);
      
    });
    socketController.locationController.stream.listen((e){
      markes.clear();
      markes.add(Marker(point: LatLng(e.lat, e.lon), child: Image.asset('assets/car.png')));
      controller.move( LatLng(e.lat, e.lon), 13);
    });
  }

  @override
  void dispose() {
    super.dispose();
    socketController.dispose();
  }
  
  
  Future<void> _getRoute(double startLat,double startLong,double endLat,double endLong, ) async {

    Api api = Api();
    const apiKey = '5b3ce3597851110001cf62484569d97889b64321891eca614e58ded8'; 
    final url ='https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$startLong,$startLat&end=$endLong,$endLat';

    final response = await api.get(url);
    if (response is DataSuccess) {
      final coordinates = response.data.data['features'][0]['geometry']['coordinates'] as List<dynamic>;
      routePoints = coordinates.map<LatLng>((coord) => LatLng(coord[1], coord[0])).toList();
      setState((){});
    } else {
      print(response.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: context.navigateBack, icon: const Icon(Icons.arrow_back, color:Colors.white),),
      ),
      body: StreamBuilder(
          stream: socketController.initLocationController.stream,
          builder: (context, snapshot) {
            return switch(snapshot.connectionState){
              ConnectionState.waiting => mapLocationShimmer(context),
              _ => FlutterMap(
                    mapController: controller,
                    options: MapOptions(
                      initialCenter: LatLng(snapshot.data!.end_point.first, snapshot.data!.end_point.last),
                      initialZoom: 13
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.cafe_mobile',
                        maxNativeZoom: 12,
                      ),
                      MarkerLayer( markers: markes),
                      MarkerLayer( markers: initMarkes ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                              points: routePoints,
                              color: Theme.of(context).primaryColor,
                              borderStrokeWidth: 3,
                              borderColor: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                ])
            };
          },
        )
    );
  }
}

