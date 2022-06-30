import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunicateWithMinistry extends StatelessWidget {
  const CommunicateWithMinistry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color(0xFF198B81),
          title: Center(
            child: Text(
              'تواصل مع الوزارة',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80.h,
            color: Colors.white,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height - 165.h),
            child: Container(
              margin: EdgeInsets.only(
                  right: 20.w, left: 20.w, top: 10.h, bottom: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 30.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Colors.grey[200]),
              child: Row(
                children: [
                  Expanded(flex: 7, child: Text('اكتب رسائلك هنا')),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF198B81),
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Transform.rotate(
                          angle: 150 * pi / 180,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20.r,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
