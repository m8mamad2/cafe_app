
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/locatino_map_shimmer.dart';
import 'package:cafe_mobile/src/core/utils/locaint_service.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: context.navigateBack,
        ),
      ),
      body: isLoading
        ? mapLocationShimmer(context)
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
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if(state is SuccessGetAddressUserState){
                      final data = state.geocodingModel.address;
                      final address = '${data.country} ${data.city}, ${data.road}';
                      context.read<UserBloc>().add(UpdateUserEvent({ 'address_name': address , 'address': [latLng.latitude,latLng.longitude]}));
                    }
                    if(state is SuccessUserState)context.navigateBack();
                  },
                  builder: (context, state) {
                    onTap()async{
                      context.read<UserBloc>().add(GetAddressUserEvent(latLng.latitude,latLng.longitude));
                      // List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
                      // print(placemarks.toString());
                      // print(placemarks.length.toString());
                      // for(var i in placemarks)log(i.street ?? '');
                    }

                    if(state is LoadingUserState) return button(context, true, (){});
                    if(state is SuccessUserState) return button(context, false, onTap);
                    if(state is FailUserState)return button(context, false, onTap);
                    return Container();
                  },
                )
              ),
            )
      ])
    
    );
  }
}

button(BuildContext context, bool isLoading, VoidCallback onTap) => FloatingActionButton(
  backgroundColor: Theme.of(context).primaryColor,
  onPressed: onTap,
  child: isLoading ? const CircularProgressIndicator(color: Colors.black,) : const Icon(Icons.check));