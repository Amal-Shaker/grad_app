import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/view_screen/quran.dart';
import 'package:grad_app/view_screen/sona.dart';
import 'package:grad_app/view_screen/tasbeeh.dart';

class TassbeehAndSupplication extends StatefulWidget {
  const TassbeehAndSupplication({Key? key}) : super(key: key);

  @override
  State<TassbeehAndSupplication> createState() =>
      _TassbeehAndSupplicationState();
}

class _TassbeehAndSupplicationState extends State<TassbeehAndSupplication> {
  bool tasbeeh = true;
  bool quran = false;
  bool sona = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80.h,
              backgroundColor: const Color(0xFF198B81),
              title: Center(
                  child: tasbeeh == true
                      ? Text(
                          'تسبيح',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        )
                      : quran == true
                          ? Text(
                              'أدعية / من القران',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'أدعية / من السنة',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ))),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        tasbeeh = false;
                        quran = true;
                        sona = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 50.h,
                      color:
                          quran == true ? Color(0xFF198B81) : Color(0xFFF0F3F6),
                      child: Center(
                        child: Text(
                          'من القران',
                          style: quran == true
                              ? TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: Colors.white)
                              : TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Color(0xFF198B81)),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        tasbeeh = false;
                        quran = false;
                        sona = true;
                      });
                    },
                    child: Container(
                      height: 50.h,
                      color:
                          sona == true ? Color(0xFF198B81) : Color(0xFFF0F3F6),
                      child: Center(
                        child: Text(
                          'من السنة',
                          style: sona == true
                              ? TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: Colors.white)
                              : TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Color(0xFF198B81)),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        tasbeeh = true;
                        quran = false;
                        sona = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      height: 50.h,
                      color: tasbeeh == true
                          ? Color(0xFF198B81)
                          : Color(0xFFF0F3F6),
                      child: Center(
                        child: Text(
                          'تسبيح',
                          style: tasbeeh == true
                              ? TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: Colors.white)
                              : TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Color(0xFF198B81)),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              quran == true
                  ? Quran()
                  : sona == true
                      ? Sona()
                      : Tasbeeh(),
            ],
          ),
        ));
  }
}
