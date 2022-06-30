import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_app/model/sos.dart';
import 'package:grad_app/model/user_info.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class SosCompany extends StatefulWidget {
  @override
  State<SosCompany> createState() => _SosCompanyState();
}

class _SosCompanyState extends State<SosCompany> {
  Set<Marker> myMarker = {};
  List<UserInformation>? all = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // print(
      //     'Provider.of<AuthProvider>(context, listen: false).getAllSosInfo${Provider.of<AuthProvider>(context, listen: false).getAllSosInfo}');
      await Provider.of<AuthProvider>(context, listen: false).getSosPostion(
          Provider.of<AuthProvider>(context, listen: false).getAllSosInfo);

      for (int i = 0;
          i <
              Provider.of<AuthProvider>(context, listen: false)
                  .getAllSosInfo!
                  .length;
          i++) {
        // provider
        //     .getSosPostion(double.parse(provider.getAllSosInfo![i].latitude!),
        //         double.parse(provider.getAllSosInfo![i].longitude!))
        //     .then((v) {
        //   street = v;
        //   print("vvvvvvvvvvvvv$v");
        // });
        myMarker.add(
          Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              infoWindow: InfoWindow(
                  onTap: () async {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .deleteSos(
                            Provider.of<AuthProvider>(context, listen: false)
                                .getAllSosInfo![i]
                                .id!);
                    await Provider.of<AuthProvider>(context, listen: false)
                        .getallSosByCompanyId();
                  },
                  title:
                      "${Provider.of<AuthProvider>(context, listen: false).getAllSosInfo![i].sid}",
                  snippet:
                      "${Provider.of<AuthProvider>(context, listen: false).allstreet![i]}"),
              markerId: MarkerId(
                  '${Provider.of<AuthProvider>(context, listen: false).getAllSosInfo![i].sid}'),
              position: LatLng(
                  double.parse(Provider.of<AuthProvider>(context, listen: false)
                      .getAllSosInfo![i]
                      .latitude!),
                  double.parse(Provider.of<AuthProvider>(context, listen: false)
                      .getAllSosInfo![i]
                      .longitude!))),
        );
      }
      // print(
      //     'Provider.of<AuthProvider>(context, listen: false)${Provider.of<AuthProvider>(context, listen: false).allstreet}');

      // Provider.of<AuthProvider>(context, listen: false).getCountSos();
      // Provider.of<AuthProvider>(context, listen: false).getallSosByCompanyId();
      // Provider.of<AuthProvider>(context, listen: false).getCountApp();
      // print('sosososososososososososooso');
      // print(Provider.of<AuthProvider>(context, listen: false).getAllSosInfo);
      // Provider.of<AuthProvider>(context, listen: false).getAllSosInfo!;

      // for (int i = 0;
      //     i <
      //         Provider.of<AuthProvider>(context, listen: false)
      //             .getAllSosInfo!
      //             .length;
      //     i++) {
      //   UserInformation a =
      //       await Provider.of<AuthProvider>(context, listen: false)
      //           .getSingleHajInfo(
      //               Provider.of<AuthProvider>(context, listen: false)
      //                   .getAllSosInfo![i]
      //                   .sid);
      //   all!.add(a);
      //   print("ggggggggggggggg$a");
      // }
    });
    // print(all);
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
        // print('count array${provider.getAllSosInfo!.length}');
        // print("lllllllllllllll$all");
        //var street;

        // for (int i = 0; i < provider.getAllSosInfo!.length; i++) {
        //   // provider
        //   //     .getSosPostion(double.parse(provider.getAllSosInfo![i].latitude!),
        //   //         double.parse(provider.getAllSosInfo![i].longitude!))
        //   //     .then((v) {
        //   //   street = v;
        //   //   print("vvvvvvvvvvvvv$v");
        //   // });
        //   myMarker.add(
        //     Marker(
        //         icon: BitmapDescriptor.defaultMarkerWithHue(
        //             BitmapDescriptor.hueRed),
        //         infoWindow: InfoWindow(
        //             onTap: () async {
        //               await provider.deleteSos(provider.getAllSosInfo![i].id!);
        //               await provider.getallSosByCompanyId();
        //             },
        //             title: "${provider.getAllSosInfo![i].sid}",
        //             snippet: "${provider.allstreet![i]}"),
        //         markerId: MarkerId('${provider.getAllSosInfo![i].sid}'),
        //         position: LatLng(
        //             double.parse(provider.getAllSosInfo![i].latitude!),
        //             double.parse(provider.getAllSosInfo![i].longitude!))),
        //   );
        // }
        // provider.getAllSosInfo!.map((e) => );
        // print('myMarker');

        // print(myMarker);
        return provider.countSos == null || provider.getAllSosInfo == null
            ? Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
