import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class DetailsRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.h,
            backgroundColor: const Color(0xFF198B81),
            title: Text(
              'تفاصيل الطلب',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Consumer<AuthProvider>(builder: (context, provider, g) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.w, top: 15.h),
                    height: 300.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(children: [
                      Row(
                        children: [
                          Image.asset('assets/images/haj_y.png'),
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
                              ': ${provider.allHajInformation!.name1} ${provider.allHajInformation!.name2} ${provider.allHajInformation!.name3} ${provider.allHajInformation!.name4}',
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
                              ': ${provider.allHajInformation!.main_haj_sid}',
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
                              Icons.location_on_outlined,
                              size: 25.r,
                              color: const Color(0xFF198B81),
                            ),
                            Text(
                              'المنطقة',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Colors.grey[400]),
                            ),
                            Text(
                              ': ${provider.allHajInformation!.area} ',
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
                              Icons.call_outlined,
                              size: 25.r,
                              color: const Color(0xFF198B81),
                            ),
                            Text(
                              'رقم الجوال ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.sp,
                                  color: Colors.grey[400]),
                            ),
                            Text(
                              ': ${provider.allHajInformation!.mobile}',
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
                    ]),
                  ),
                  Container(
                    height: 5.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.w, top: 15.h),
                    height: 400.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Row(
                          children: [
                            Image.asset('assets/images/follower_y.png'),
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
                          height: 20.h,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: provider.allComForHaj!
                                .map(
                                  (e) => ExpandableNotifier(
                                    child: ScrollOnExpand(
                                      child: ExpandablePanel(
                                        header: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10.w, left: 7.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.person_outline,
                                                    size: 25.r,
                                                    color:
                                                        const Color(0xFF198B81),
                                                  ),
                                                  Text(
                                                    '${e.name1} ${e.name2}  ${e.name4}| ',
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 14.sp,
                                                        color: const Color(
                                                            0xFF24241C)),
                                                  ),
                                                  Text(
                                                    '${e.sid}',
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 14.sp,
                                                        color: const Color(
                                                            0xFF198B81)),
                                                  ),
                                                  SizedBox(
                                                    width: 80.w,
                                                  ),
                                                  // const InkWell(
                                                  //   child: Icon(
                                                  //     Icons.arrow_drop_down,
                                                  //     color:
                                                  //         const Color(0xFF198B81),
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              height: 3.h,
                                              color: Colors.grey[100],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                        collapsed: Text(''),
                                        expanded: Column(children: [
                                          ListTile(
                                            leading: Image.asset(
                                                'assets/images/file.png'),
                                            title:
                                                Text("رقم الهوية : ${e.sid}"),
                                          ),
                                          ListTile(
                                            leading: Image.asset(
                                                'assets/images/location.png'),
                                            title:
                                                Text("المنطقة : ${e.address}"),
                                          ),
                                          ListTile(
                                            leading: Image.asset(
                                                'assets/images/phone.png'),
                                            title: Text(
                                                "رقم الجوال : ${e.mobile}"),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 10.w),
                        //   height: 3.h,
                        //   color: Colors.grey[100],
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(right: 10.w),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.person_outline,
                        //         size: 25.r,
                        //         color: const Color(0xFF198B81),
                        //       ),
                        //       Text(
                        //         'محمد أحمد علي دلول | ',
                        //         style: TextStyle(
                        //             fontFamily: 'Cairo',
                        //             fontSize: 14.sp,
                        //             color: const Color(0xFF24241C)),
                        //       ),
                        //       Text(
                        //         '123456789',
                        //         style: TextStyle(
                        //             fontFamily: 'Cairo',
                        //             fontSize: 14.sp,
                        //             color: const Color(0xFF198B81)),
                        //       ),
                        //       SizedBox(
                        //         width: 80.w,
                        //       ),
                        //       const InkWell(
                        //         child: Icon(
                        //           Icons.arrow_drop_down,
                        //           color: const Color(0xFF198B81),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 10.w),
                        //   height: 3.h,
                        //   color: Colors.grey[100],
                        // ),
                      ]),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}


/**
 *  Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, left: 7.w),
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
                                        '${e.name1} ${e.name2}  ${e.name4}| ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 14.sp,
                                            color: const Color(0xFF24241C)),
                                      ),
                                      Text(
                                        '${e.sid}',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 14.sp,
                                            color: const Color(0xFF198B81)),
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                      ),
                                      const InkWell(
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: const Color(0xFF198B81),
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
                                ),
                              ],
                            ),
 */