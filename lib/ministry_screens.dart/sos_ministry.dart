import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_app/model/sos.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class SosMinistry extends StatefulWidget {
  @override
  State<SosMinistry> createState() => _SosCompanyState();
}

class _SosCompanyState extends State<SosMinistry> {
  Set<Marker> myMarker = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      print('sosososososososososososooso');
      print(Provider.of<AuthProvider>(context, listen: false).getallSos);
      await Provider.of<AuthProvider>(context, listen: false).getSosPostion(
          Provider.of<AuthProvider>(context, listen: false).allSosForMinistry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: const Color(0xFF198B81),
        title: Center(
          child: Text(
            'نداءات الإسستغاثة',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, g) {
        print('count array${provider.allSosForMinistry!.length}');
        for (int i = 0; i < provider.allSosForMinistry!.length; i++) {
          myMarker.add(
            Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
                infoWindow: InfoWindow(
                    title: "${provider.allSosForMinistry![i].sid}",
                    snippet: "${provider.allstreet![i]}"),
                markerId: MarkerId('${provider.allSosForMinistry![i].sid}'),
                position: LatLng(
                    double.parse(provider.allSosForMinistry![i].latitude!),
                    double.parse(provider.allSosForMinistry![i].longitude!))),
          );
        }
        // provider.getAllSosInfo!.map((e) => );
        print('myMarker');

        print(myMarker);
        return provider.allSosForMinistry!.length == 0
            ? Container(
                child: Column(children: [
                  Center(
                    child: Image.asset('assets/images/vol.png'),
                  ),
                  Center(
                      child: Text(
                    'لا يوجد نداءات الإستغاثة بعد',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18.sp,
                    ),
                  )),
                ]),
              )
            : Container(
                child: GoogleMap(
                  markers: myMarker,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(68.828629, 120.196005),
                      // : LatLng(provider.current_position!.latitude,
                      //     provider.current_position!.longitude),
                      zoom: 1),
                  onMapCreated: (GoogleMapController controller) {},
                ),
              );
      }),

      // const Card(
      //   elevation: 3,
      //   child: ListTile(
      //     leading: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: Icon(
      //         Icons.notifications_none,
      //         color: Color(0xFF198B81),
      //       ),
      //       // backgroundImage: AssetImage('assets/images/ogaf.png'),
      //     ),
      //     title: Text('اسم الإشعار'),
      //     subtitle:
      //         Text('محتوى الاشعار هو كالتالي قد تكون الاشعارات في حالة  '),
      //     trailing: Text('7:05'),
      //   ),
      // ),
    );
  }
}
