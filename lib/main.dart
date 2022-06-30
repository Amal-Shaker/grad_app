import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/helper/auth_helper.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:grad_app/view_screen/splash_screen.dart';
import 'package:provider/provider.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';

void main() {
  runApp(ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context, listen: false).getPosition(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext c) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(fontFamily: 'Cairo'),
        home: FirebaseConfiguration(),
        // home: MainHome(),
      ),
    );
  }
}

class FirebaseConfiguration extends StatelessWidget {
  static String routeName = 'firebaseConfiguration';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> dataSnappshot) {
          if (dataSnappshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text(dataSnappshot.error.toString()),
              ),
            );
          }
          if (dataSnappshot.connectionState == ConnectionState.done) {
            // return Scaffold(
            //   body: Text('DONE'),
            // );
            return MySplashScreen();
          }
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        });
  }
}
