import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/add_follower.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:provider/provider.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.h,
            backgroundColor: const Color(0xFF198B81),
            title: Text(
              'القرعة',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Container(
                  width: 277.w,
                  height: 232.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/selected.png')),
                    // color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Center(
                child: Text(
                  '''لقد تم دخولك علي القرعة بنجاح
 انتظر حتى يتم ارسال اشعار الك 
اذا كنت من المقبولين لأداء فريضة الحج لهذا
 العام او في المرة القادم ان شاء الله''',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      color: const Color(0xFF198B81),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 180.h,
              ),
              InkWell(
                onTap: () {
                  provider.step3 = true;
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainHome()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFF198B81),
                        // gradient: LinearGradient(
                        //     begin: Alignment.centerLeft,
                        //     end: Alignment.centerRight,
                        //     colors: <Color>[
                        //       Color(0xFF2C698D),
                        //       Color(0xFF79A8CF)
                        //     ]),
                        //color: colors.LinearGradient(colors: [colors]),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                        child: Text(
                      'التالي ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: const Color(0xFFFFFFFF),
                          fontSize: 20.sp),
                    ))),
              ),
              // Image.asset('assets/images/selected.png'),
            ],
          ),
        ),
      );
    });
  }
}
