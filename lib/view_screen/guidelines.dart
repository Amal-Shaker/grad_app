import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/view_screen/arkan.dart';
import 'package:grad_app/view_screen/duties_and_senn.dart';
import 'package:grad_app/view_screen/fatawy.dart';
import 'package:grad_app/view_screen/taboos.dart';

class Guidelines extends StatefulWidget {
  const Guidelines({Key? key}) : super(key: key);

  @override
  State<Guidelines> createState() => _GuidelinesState();
}

class _GuidelinesState extends State<Guidelines> {
  bool? taboos = false;
  bool? dutiesAndsenn = false;
  bool? fatawy = false;
  bool? arkan = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF198B81),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 8,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     margin: EdgeInsets.only(left: 10.w),
                //     height: 45.h,
                //     color: Colors.white,
                //     child: Container(
                //       padding: EdgeInsets.only(right: 10.w),
                //       height: 30.h,
                //       width: MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(5.r),
                //           color: Colors.grey[200]),
                //       child: Row(
                //         children: [
                //           Expanded(flex: 7, child: Text(' بحث')),
                //           Expanded(
                //             flex: 1,
                //             child: Container(
                //                 height: 50.h,
                //                 width: 40.w,
                //                 decoration: BoxDecoration(
                //                     color: Color(0xFFD8BA52),
                //                     borderRadius: BorderRadius.circular(5.r)),
                //                 child: Icon(
                //                   Icons.search,
                //                   color: Colors.white,
                //                   size: 20.r,
                //                 )),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      taboos = true;
                      dutiesAndsenn = false;
                      fatawy = false;
                      arkan = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF198B81)),
                      color: taboos == true
                          ? Color(0xFF198B81)
                          : Color(0xFFF0F3F6),
                    ),
                    child: Center(
                      child: Text(
                        'محظورات',
                        style: taboos == true
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
                      taboos = false;
                      dutiesAndsenn = true;
                      fatawy = false;
                      arkan = false;
                    });
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF198B81)),
                      color: dutiesAndsenn == true
                          ? Color(0xFF198B81)
                          : Color(0xFFF0F3F6),
                    ),
                    child: Center(
                      child: Text(
                        'واجبات وسنن',
                        style: dutiesAndsenn == true
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
                      taboos = false;
                      dutiesAndsenn = false;
                      fatawy = true;
                      arkan = false;
                    });
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF198B81)),
                      color: fatawy == true
                          ? Color(0xFF198B81)
                          : Color(0xFFF0F3F6),
                    ),
                    child: Center(
                      child: Text(
                        'فتاوي',
                        style: fatawy == true
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
                      taboos = false;
                      dutiesAndsenn = false;
                      fatawy = false;
                      arkan = true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF198B81)),
                      color:
                          arkan == true ? Color(0xFF198B81) : Color(0xFFF0F3F6),
                    ),
                    child: Center(
                      child: Text(
                        'أركان',
                        style: arkan == true
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
            Container(
                //color: Colors.red,
                height: 635.h,
                width: 400.w,
                child: taboos == true
                    ? Taboos()
                    : dutiesAndsenn == true
                        ? DutiesAndSenn()
                        : fatawy == true
                            ? Fatawy()
                            : Arkan())
          ],
        ),
      ),
    );
  }
}
