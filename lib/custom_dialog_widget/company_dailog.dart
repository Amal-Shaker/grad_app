import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class CompanyDetailDaliog extends StatelessWidget {
  int? id;
  CompanyDetailDaliog({this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
          body: provider.companyInfoById == null
              ? CircularProgressIndicator()
              : Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                      height: 455.h,
                      width: 345.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '${provider.companyInfoById!.Company_name}',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  color: Color(0xFFD8BA52),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.document_scanner,
                                color: Color(0xFF198B81),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'عن الشركة',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 16.sp,
                                    color: Color(0xFF198B81)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text('''${provider.companyInfoById!.about_us}'''),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 2.h,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Color(0xFF198B81),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'بيانات التواصل مع الشركة',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 16.sp,
                                    color: Color(0xFF198B81)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w),
                            child: Text(
                              '${provider.companyInfoById!.mobile}',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Color(0xFF24241C)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w),
                            child: Text(
                              '${provider.companyInfoById!.tel}',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Color(0xFF24241C)),
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Color(0xFFD8BA52)),
                                  height: 54.h,
                                  width: 150.w,
                                  child: Center(
                                    child: Text(
                                      'خروج',
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Color(0xFF198B81)),
                                  height: 54.h,
                                  width: 150.w,
                                  child: Center(
                                    child: Text(
                                      'اختيار الشركة',
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
    });
  }
}
