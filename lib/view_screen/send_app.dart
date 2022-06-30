import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:provider/provider.dart';

import 'fill_follower_app.dart';

class SendApp extends StatelessWidget {
  const SendApp({Key? key}) : super(key: key);

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
              'إضافة مرافق',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: provider.allCompination == null
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
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
                              borderRadius: BorderRadius.circular(5.r),
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
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xFFD8BA52)),
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
                      padding: EdgeInsets.only(right: 15.w, top: 15.h),
                      height: 200.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          children: [
                            Image.asset('assets/images/elhaj_icon.png'),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'الحاج',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: const Color(0xFFD8BA52),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                size: 25.r,
                                color: const Color(0xFF198B81),
                              ),
                              Text(
                                ' اسم الحاج ',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 14.sp,
                                    color: Colors.grey[400]),
                              ),
                              Text(
                                ': ${provider.hajInfo!.name1} ${provider.hajInfo!.name2} ${provider.hajInfo!.name3} ${provider.hajInfo!.name4}',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 14.sp,
                                    color: const Color(0xFF373636)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          height: 3.h,
                          color: Colors.grey[100],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.file_open_outlined,
                                size: 25.r,
                                color: const Color(0xFF198B81),
                              ),
                              Text(
                                ' رقم الهوية ',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 14.sp,
                                    color: Colors.grey[400]),
                              ),
                              Text(
                                ': ${provider.mainHajId}',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 14.sp,
                                    color: const Color(0xFF373636)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          height: 3.h,
                          color: Colors.grey[100],
                        ),
                      ]),
                    ),
                    Container(
                      height: 10.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.w, top: 15.h),
                      height: 200.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          children: [
                            Image.asset('assets/images/followers.png'),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'المرافقين',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: const Color(0xFFD8BA52),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // provider.allCompination.map((e) {
                        Column(
                          children: provider.allCompination!
                              .map((e) => Column(
                                    children: [
                                      Container(
                                        height: 0,
                                        width: 0,
                                        child: Text(
                                            "${e.gender == "ذكر" ? provider.completeApp = true : provider.completeApp = false}"),
                                      ),
                                      // ListTile(leading: ,t),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.person_outline,
                                              size: 25.r,
                                              color: const Color(0xFF198B81),
                                            ),
                                            Text(
                                              '${e.name1} ${e.name2} ${e.name4} | ',
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFF24241C)),
                                            ),
                                            Text(
                                              '${e.sid}',
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFF198B81)),
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                            ),
                                            InkWell(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        height: 3.h,
                                        color: Colors.grey[100],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      )
                                    ],
                                  ))
                              .toList(),
                        ),
                      ]),
                    ),
                    Container(
                      height: 10.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(bottom: 0.h, right: 15.w, top: 15.h),
                      margin: EdgeInsets.only(bottom: 0.h),
                      color: Colors.white,
                      height: 120.h,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/elhaj_company.png'),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'شركة الحج',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 16.sp,
                                    color: const Color(0xFFD8BA52),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  size: 25.r,
                                  color: const Color(0xFF198B81),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${provider.companyInfoById!.Company_name}',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      color: Color(0xFF24241C)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 30.h, bottom: 0.h),
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
                                border:
                                    Border.all(color: const Color(0xFF198B81)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
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
                              provider.step2 = true;

                              if (provider.completeApp == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MainHome()));
                              } else {
                                showAboutDialog(context: context, children: [
                                  Container(
                                    child: Text(' يجب ادخال محرم'),
                                  )
                                ]);
                              }
                            },
                            child: Container(
                              height: 54.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF198B81),
                                borderRadius: BorderRadius.circular(5.r),
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
                    )
                  ],
                ),
        ),
      );
    });
  }
}
