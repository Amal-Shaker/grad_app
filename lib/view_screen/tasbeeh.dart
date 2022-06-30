import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class Tasbeeh extends StatelessWidget {
  const Tasbeeh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Container(
        height: 517.h,
        width: 347.w,
        decoration: const BoxDecoration(
            // image:
            //     DecorationImage(image: AssetImage('assets/images/tassbeeh.png'))

            ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.grey[350]),
                  child: Center(
                      child: Text(
                    "${provider.getCount()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ))),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF198B81),
                          borderRadius: BorderRadius.circular(25.r)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      provider.increasCount();
                      print(provider.counter);
                      //provider.getCount();
                    },
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  InkWell(
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF198B81),
                          borderRadius: BorderRadius.circular(25.r)),
                      child: const Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      provider.restCount();
                    },
                  ),
                ],
              )
            ]),
      );
    });
  }
}
