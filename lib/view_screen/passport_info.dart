import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

import 'main_home.dart';

class PassportInformation extends StatelessWidget {
  const PassportInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF198B81),
                  ))
            ],
            toolbarHeight: 90.h,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            centerTitle: true,
            title: Text(
              'بيانات الجواز',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF198B81)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 134.h,
                    width: 262.w,
                    decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage('assets/images/passport.png'))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'الاسم الأول ',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 16.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F6),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: TextField(
                          controller: provider.passname1Controller,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: Color(0xFF707070)),
                              hintText: 'الاسم الأول',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F6),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: TextField(
                          controller: provider.passname2Controller,
                          decoration: const InputDecoration(
                              hintText: 'F', border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F6),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: TextField(
                          controller: provider.passname3Controller,
                          decoration: const InputDecoration(
                              hintText: 'F', border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F6),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: TextField(
                          controller: provider.passname4Controller,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: Color(0xFF707070)),
                              hintText: 'الاسم الأخير',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Text(
                    'رقم الجواز',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 16.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF0F3F6),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.passNumberController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Text(
                    'تاريخ الانتهاء ',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 16.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF0F3F6),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.passExpiryController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Text(
                    'مكان الإصدار',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 16.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF0F3F6),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            'اضافة صورة شخصية ',
                            style:
                                TextStyle(fontFamily: 'Cairo', fontSize: 18.sp),
                          ),
                          Text(
                            '(اختياري)',
                            style:
                                TextStyle(fontFamily: 'Cairo', fontSize: 10.sp),
                          )
                        ],
                      )),
                      const Icon(
                        Icons.add,
                        color: Color(0xFF198B81),
                      ),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/addImage.png'))),
                      )
                      //)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            'اضافة صورة الجواز ',
                            style:
                                TextStyle(fontFamily: 'Cairo', fontSize: 18.sp),
                          ),
                          Text(
                            '(اختياري)',
                            style:
                                TextStyle(fontFamily: 'Cairo', fontSize: 10.sp),
                          )
                        ],
                      )),
                      const Icon(
                        Icons.add,
                        color: Color(0xFF198B81),
                      ),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/addImage.png'))),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h, left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFF198B81),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'إرسال',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: const Color(0xFFFFFFFF),
                              fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    provider.step4 = true;
                    provider.postPassportDetails(context);
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => MainHome()));
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
