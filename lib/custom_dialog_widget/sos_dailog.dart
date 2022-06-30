import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/distress_call.dart';
import 'package:provider/provider.dart';

class SosDailog extends StatelessWidget {
  const SosDailog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
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
                Image.asset('assets/images/sos.png'),
                Text(
                  '''في حالة كنت تائهاً الرجاء بعث اشارة استغاثة 
و البقاء في مكانك لوقت وصول احد المساعدين لك  او يمكنك تحديد موقعك الحالي على الخريطة
شكرا لك''',
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Color(0xFF198B81)),
                    height: 54.h,
                    width: 300.w,
                    child: Center(
                      child: Text(
                        'اشارة استغاثة',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .postSosInfo(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DistressCall()));
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
