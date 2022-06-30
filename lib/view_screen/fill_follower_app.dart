import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/send_app.dart';
import 'package:provider/provider.dart';

class FillFollowerApp extends StatelessWidget {
  const FillFollowerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            backgroundColor: const Color(0xFF198B81),
            title: Center(
              child: Text(
                'إضافة مرافق',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: provider.compinationInfo == null
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 110.h,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 10.h, top: 5.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/info_haj.png'))),
                                        ),
                                        Text(
                                          'بيانات الحاج',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF198B81)),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: const Color(0xFFD8BA52),
                                      ),
                                      height: 4.h,
                                      width: 74.w,
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/add_follower.png'))),
                                        ),
                                        Text(
                                          'إضافة مرافق',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: Colors.grey[400]),
                                      height: 4.h,
                                      width: 74.w,
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/send_form.png'))),
                                        ),
                                        Text(
                                          'إرسال الطلب ',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF24241C)),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                height: 10.h,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[200],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                height: 100.h,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Row(children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(right: 5.w),
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'رقم هوية المرافق',
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 16.sp,
                                                  color:
                                                      const Color(0xFF24241C)),
                                              border: InputBorder.none),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: Color(0xFF198B81)),
                                        child: Center(
                                            child: Text(
                                          'إضافة',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: Colors.white),
                                        )),
                                      ))
                                ]),
                              ),
                              Container(
                                height: 10.h,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[200],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5.w, right: 5.w, top: 10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'بيانات المرافق',
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18.sp,
                                          color: Color(0xFFD8BA52),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'اسم المرافق',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 16.sp,
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                // margin: EdgeInsets.symmetric(
                                                //     horizontal: 3.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.name1} ${provider.compinationInfo!.name2} ${provider.compinationInfo!.name3} ${provider.compinationInfo!.name4}")),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'تاريخ الميلاد',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 16.sp,
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                // margin: EdgeInsets.symmetric(
                                                //     horizontal: 3.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.dob}")),
                                          ],
                                        )),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10.w),
                                              child: Text(
                                                'اسم الأم',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 16.sp,
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.mother_name}")),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'المنطقة الحالية ',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.area}")),
                                          ],
                                        )),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'الجنس',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.gender}")),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'مكان الميلاد',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 16.sp,
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: Text(
                                                    "${provider.compinationInfo!.birth_place}")),
                                          ],
                                        )),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Text(
                                                'الحالة الاجتماعية',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        const Color(0xFF198B81),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                padding: EdgeInsets.only(
                                                    right: 10.w, top: 10.h),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child:
                                                    Text("الحالة الإجتماعية")),
                                          ],
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.h,
                                      padding: EdgeInsets.only(
                                          right: 10.w, top: 10.h),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 3.w),
                                          child: Text(
                                              "${provider.companyInfoById!.Company_name}")),
                                    ),
                                    //
                                    //
                                    //
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: TextField(
                                          controller: provider
                                              .comMobileNumberController,
                                          decoration: InputDecoration(
                                              hintText: 'رقم الجوال(اختياري)',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: TextField(
                                          controller:
                                              provider.comAddressController,
                                          decoration: InputDecoration(
                                              hintText:
                                                  'الشارع أو رقم المنزل (اختياري)',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.postCompination(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 45.h,
                                          width: 178.w,
                                          // margin: EdgeInsets.symmetric(horizontal: 50.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: const Color(0xFFD8BA52)),
                                          child: Center(
                                              child: Text(
                                            'إضافة مرافق',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 10.h,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[200],
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 54.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF198B81)),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'السابق',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 20.sp,
                                                color: const Color(0xFF198B81)),
                                          ),
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        provider.getAllCompinationForHaj();

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SendApp()));
                                      },
                                      child: Container(
                                        height: 54.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF198B81),
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'التالي',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 20.sp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.w,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
