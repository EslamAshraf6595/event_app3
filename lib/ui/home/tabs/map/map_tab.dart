import 'package:event_planing_app/ui/home/tabs/map/eventMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTab extends StatefulWidget {
  MapTab({
    super.key,
  });
  GoogleMapController? mapController;
  String? mapStyle;

  @override
  State<MapTab> createState() => _MapTabState();
}

String? mapStyle;

class _MapTabState extends State<MapTab> {
  Future<void> lodeMapStyle() async {
    final String style =
        await rootBundle.loadString('assets/mapstyle/mapStyleDark.json');
    setState(() {
      mapStyle = style;
    });
  }

  GoogleMapController? mapController;
  Location location = Location();
  LatLng? intilLatLng;

  Future<void> userLocation() async {
    //1=> check if location services is enable
    bool serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled == false) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        //user not give the prmasion to open the location from his wone phone
        return;
      }
    }
    //2=> check premesion state
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        //user denied to get his location
        return;
      }
    }
    if (permissionGranted == PermissionStatus.deniedForever) {
      return;
    }
    //3=>get location
    final LocationData locationData = await location.getLocation();
    if (locationData == null) return;
    //4=>update
    setState(() {
      intilLatLng = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lodeMapStyle();
    userLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (intilLatLng == null) {
      return const Scaffold(
        body: Center(
            child:
                CircularProgressIndicator()), // show loading while location is null
      );
    }

    return Scaffold(
      body: GoogleMap(
        //style: mapStyle,
        onMapCreated: (controller) {
          mapController = controller;
          // if (mapStyle != null) {
          //   controller.setMapStyle(mapStyle); // apply map style if loaded
          // }
          //widget.mapController.setMapStyle(mapStyle); // unused
        },

        cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            southwest: LatLng(22.003308, 25.021967),
            northeast: LatLng(
                31.329361, 34.217357))), //عشان تحدد  الحدود اللي هتشتغل غليها
        myLocationButtonEnabled: true,
        //zoomControlsEnabled: false, //to disaple (+,-) zoom
        zoomGesturesEnabled:
            true, //to make user doess't allow to his to make any zoom

        markers: ListEventCity.map((CityEvent e) => Marker(
            onTap: () {
              anamitedCameraPosition(e);
              setState(() {});
            },
            markerId: MarkerId(e.id.toString()),
            position: LatLng(e.lat, e.log),
            infoWindow: InfoWindow(title: e.name))).toSet(),
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          zoom: 17,
          target: intilLatLng!, // now safe to use
        ),
      ),
    );
  }

  Future<void> anamitedCameraPosition(CityEvent e) async {
    CameraPosition cameraPosition =
        CameraPosition(zoom: 16, target: LatLng(e.lat, e.log));
    Future.delayed(Duration(milliseconds: 800), () {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    });
  }
}
