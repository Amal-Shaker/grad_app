import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/helper/firestore_helper.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:grad_app/view_screen/register.dart';
import 'package:grad_app/view_screen/resetpassword.dart';
import 'package:provider/provider.dart';

import '../company_screen.dart/main_home.dart';
import '../ministry_screens.dart/main_home.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Object? val = 1;
  bool sec = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //await FirestoreHelper.firestoreHelper.getAllChatDoc();
  }

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
                    child: Image.asset(
                        'assets/images/logo.png') //AssetImage('assets/images/logo.png'),,
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
                            child: Text('تسجيل دخول',
                                style: TextStyle(
                                    color: const Color(0xFF198B81),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('التسجيل ك',
                              style: TextStyle(
                                  color: const Color(0xFF373636),
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text("حاج"),
                                leading: Radio(
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  const Text("صاحب شركة"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  const Text("مشرف وزارة"),
                                ],
                              ),
                            ),
                          ],
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
                            obscureText: sec,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      sec == false;
                                    },
                                    icon: Icon(Icons.visibility)),
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
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            val == 2
                                ? provider.loginType = 1
                                : val == 3
                                    ? provider.loginType = 2
                                    : provider.loginType = 0;
                            //provider.getAllCompany();
                            // provider.getSingleCompany(1);
                            provider.postLogin(context);
                            // provider.login(context);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         MainHomeCompany() //   MainHomeMinistry() //MainHomeCompany() //MainHome()
                            //     ));
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        val == 1
                            ? Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    ForgetPass())));
                                      },
                                      child: Text(
                                        'هل نسيت كلمة المرور؟',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 14.sp,
                                            color: Color(0xFF707070)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    Register())));
                                      },
                                      child: Text('مستخدم جديد',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: Colors.black)),
                                    )
                                  ],
                                ),
                              )
                            : Text('')
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
