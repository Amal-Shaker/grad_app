import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:your_splash/your_splash.dart';

import 'ex.dart';
import 'login_screen.dart';

// ignore: use_key_in_widget_constructors
class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF198B81),
      body: Stack(
        children: [
          EasySplashScreen(
            logo: Image.asset(
              'assets/images/splashImage.png',
              width: 346.w,
              // height: 313.h,
              height: 290.h,
              fit: BoxFit.cover,
            ),
            logoSize: 160.r,
            backgroundColor: const Color(0xFF198B81),
            title: Text(
              '''وزارة الأوقاف والشؤون الدينية 
        المحافظات الجنوبية                 
      برنامج إدارة موسم الحج'''
              //     '''وزارة الأوقاف والشؤون الدينية
              // المحافظات الجنوبية
              //        برنامج إدارة موسم الحج'''
              ,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20.sp,
                  color: const Color(0xFFFFFFFF)),
              textAlign: TextAlign.center,
            ),
            navigator: const Login(),
            durationInSeconds: 3,
          ),
          Container(
            height: 110.h,
            width: 105.w,
            margin: EdgeInsets.only(
                left: 135.w, right: 133.w, top: 236.h), //, bottom: 30.h
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );

    // return SplashScreen.timed(
    //     seconds: 3,
    //     route: MaterialPageRoute(builder: (_) => const Login()),
    //     body: Scaffold(
    //         backgroundColor: const Color(0xFF198B81),
    //         body: Column(
    //           children: [
    //             Container(
    //               height: 313.h,
    //               width: 346.w,
    //               margin: EdgeInsets.only(
    //                   left: 15.w, right: 15.w, top: 40.h, bottom: 30.h),
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage('assets/images/splashImage.png'),
    //                       fit: BoxFit.fill)),
    //               child: Center(
    //                 child: Container(
    //                   height: 110.h,
    //                   width: 110.w,
    //                   decoration: const BoxDecoration(
    //                       image: DecorationImage(
    //                           fit: BoxFit.fill,
    //                           image: AssetImage('assets/images/logo.png'))),
    //                 ),
    //               ),
    //             ),
    //             Text(
    //               'وزارة الأوقاف والشؤون الدينية',
    //               style: TextStyle(
    //                   fontFamily: 'Cairo',
    //                   fontSize: 20.sp,
    //                   color: const Color(0xFFFFFFFF)),
    //             ),
    //             Text(
    //               'المحافظات الجنوبية ',
    //               style: TextStyle(
    //                   fontFamily: 'Cairo',
    //                   fontSize: 20.sp,
    //                   color: const Color(0xFFFFFFFF)),
    //             ),
    //             Text(
    //               'برنامج إدارة موسم الحج',
    //               style: TextStyle(
    //                   fontFamily: 'Cairo',
    //                   fontSize: 20.sp,
    //                   color: const Color(0xFFFFFFFF)),
    //             ),
    //           ],
    //         )));
  }
}
