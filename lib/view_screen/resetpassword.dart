import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/auth_providers.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        //appBar: AppBar_widget(),
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Container(
              margin: EdgeInsets.only(right: 30.w, left: 30.w, top: 20.h),
              child: Column(children: <Widget>[
                Form(
                  child: Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Forgot password ',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: const Color(0xFF198B81),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            'please enter your email to receive a link',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: Text(
                            'to create a new password via email',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
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
                                  'حفظ',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            provider.resetPassword();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         MainHomeMinistry() //MainHomeCompany() //MainHome()
                            //     ));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ]));
        }));
  }
}
