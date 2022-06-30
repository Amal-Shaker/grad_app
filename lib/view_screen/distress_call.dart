import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class DistressCall extends StatefulWidget {
  const DistressCall({Key? key}) : super(key: key);

  @override
  State<DistressCall> createState() => _DistressCallState();
}

class _DistressCallState extends State<DistressCall> {
  Set<Marker> myMarker = {};
  var current_lat;
  var current_long;
  @override
  void initState() {
    // TODO: implement initState
    current_lat = Provider.of<AuthProvider>(context, listen: false)
        .current_position!
        .latitude;
    current_long = Provider.of<AuthProvider>(context, listen: false)
        .current_position!
        .longitude;

    super.initState();

    myMarker.add(
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(title: "your location"),
          markerId: MarkerId('current'),
          position: LatLng(current_lat, current_long)),
    );
    // Future.delayed(Duration.zero, () {
    //   Provider.of<AuthProvider>(context, listen: false).postSosInfo(context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: const Color(0xFF198B81),
        title: Center(
          child: Text(
            'نداء الإستغاثة',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, g) {
        return Container(
          child: GoogleMap(
            markers: myMarker,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: provider.current_position == null
                    ? LatLng(68.828629, 120.196005)
                    : LatLng(provider.current_position!.latitude,
                        provider.current_position!.longitude),
                zoom: 3),
            onMapCreated: (GoogleMapController controller) {},
          ),
        );
      }),
    );
  }
}
