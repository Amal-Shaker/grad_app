import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:provider/provider.dart';

import '../company_screen.dart/main_home.dart';
import '../ministry_screens.dart/main_home.dart';
import '../providers/auth_providers.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250.h,
                  color: const Color(0xFF198B81),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('إنشاء حساب ',
                                style: TextStyle(
                                    color: const Color(0xFF198B81),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('رقم الهوية',
                              style: TextStyle(
                                  color: const Color(0xFF373636),
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp)),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10.w),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFFdfeaee),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextField(
                            controller: provider.sidController,
                            decoration: const InputDecoration(
                                hintText: 'رقم الهوية',
                                border: InputBorder.none),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('إيميل',
                              style: TextStyle(
                                  color: const Color(0xFF373636),
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp)),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10.w),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFFdfeaee),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextField(
                            controller: provider.emailController,
                            decoration: const InputDecoration(
                                hintText: 'إيميل', border: InputBorder.none),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('كلمة المرور',
                              style: TextStyle(
                                  color: const Color(0xFF373636),
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp)),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10.w),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFFdfeaee),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: provider.passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.visibility),
                                hintText: 'كلمة المرور',
                                border: InputBorder.none),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 30.h, left: 15.w, right: 15.w),
                            decoration: BoxDecoration(
                                color: const Color(0xFF198B81),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'تسجيل ',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            //  provider.register(context);
                            provider.postRegister();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Login() //MainHomeCompany() //MainHome()
                                ));
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
