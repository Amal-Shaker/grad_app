import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndSosDailog extends StatelessWidget {
  const EndSosDailog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
          height: 455.h,
          width: 345.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/end_sos.png'),
              Text(
                '''تم بحمد الله العثور علي المفقود وتم عمل اللازم من قبل الشركة ورجع سالما بكل صحة الي الفندق بحمد الله ''',
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(0xFF198B81)),
                height: 54.h,
                width: 300.w,
                child: Center(
                  child: Text(
                    'الرجوع',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20.sp,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
