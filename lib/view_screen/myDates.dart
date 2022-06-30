import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/view_screen/tafoaj.dart';
import 'package:grad_app/view_screen/taskeen.dart';

class MyDates extends StatefulWidget {
  const MyDates({Key? key}) : super(key: key);

  @override
  State<MyDates> createState() => _MyDatesState();
}

class _MyDatesState extends State<MyDates> {
  bool? taskeen = false;
  bool? tafoaj = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: const Color(0xFF198B81),
          title: Center(
              child: taskeen == true
                  ? Text(
                      'التسكين',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'التفويج',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )),
        ),
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
                      tafoaj = true;
                      taskeen = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    height: 50.h,
                    color:
                        tafoaj == true ? Color(0xFF198B81) : Color(0xFFF0F3F6),
                    child: Center(
                      child: Text(
                        'التفويج',
                        style: tafoaj == true
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
                      tafoaj = false;
                      taskeen = true;
                    });
                  },
                  child: Container(
                    height: 50.h,
                    color:
                        taskeen == true ? Color(0xFF198B81) : Color(0xFFF0F3F6),
                    child: Center(
                      child: Text(
                        'التسكين',
                        style: taskeen == true
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
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            tafoaj == true ? Tafoaj() : Taskeen()
          ],
        ),
      ),
    );
  }
}
