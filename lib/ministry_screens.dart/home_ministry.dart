import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/ministry_screens.dart/all_company.dart';
import 'package:grad_app/ministry_screens.dart/haj_register_request_ministry.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:provider/provider.dart';

import '../company_screen.dart/haj_register_request.dart';

class HomeMinistry extends StatefulWidget {
  @override
  State<HomeMinistry> createState() => _HomeMinistryState();
}

class _HomeMinistryState extends State<HomeMinistry> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero, () {
    Future.delayed(Duration.zero, () async {
      await Provider.of<AuthProvider>(context, listen: false)
          .getAllAcceptHajs();
      await Provider.of<AuthProvider>(context, listen: false).getallSos();
      await Provider.of<AuthProvider>(context, listen: false)
          .getlistAllHajAcccountForMinistry(
              Provider.of<AuthProvider>(context, listen: false).allAcceptHajs);
      await Provider.of<AuthProvider>(context, listen: false).getAllCompany();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, g) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Color(0xFF198B81),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage:
                            const AssetImage('assets/images/ogaf.png'),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Text(
                        'وزارة الأوقاف والشؤون الدينية',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ListAllHaj()));
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    'قائمة الحجاج',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AllCompany()));
                  },
                  leading: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'قائمة الشركات',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  title: Text(
                    ' تواصل مع الوزارة',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  title: Text(
                    'تقييمات الحجاج',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    ' عن الشركة',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 1.h,
                  width: 220.w,
                  color: Colors.grey[500],
                ),
              ]),
        ),
        body:
            //  Consumer<AuthProvider>(builder: (context, provider, g) {
            //   return

            // provider.allAcceptHajs!.length == 0
            //     ? CircularProgressIndicator()
            //     :

            Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff198B81),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.r),
                          bottomRight: Radius.circular(25.r))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50.h, right: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'أهلا  بك في تطبيق الحج',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            width: 156.w,
                            height: 96.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFFD8BA52),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'نداءات الإستغاثة',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${provider.allSosForMinistry!.length}',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      color: Color(0xFF198B81)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            width: 156.w,
                            height: 96.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFFD8BA52),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'طلبات التسجيل',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${provider.allAcceptHajs!.length}',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      color: Color(0xFF198B81)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 40.h,
              ),
              height: 230.h,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'طلبات التسجيل للحج',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD8BA52)),
                        ),
                        provider.allAcceptHajs!.length == 0 ||
                                provider.allAcceptHajs!.length == null
                            ? Text(' ')
                            : InkWell(
                                child: Text(
                                  'رؤية كل الطلبات',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      color: Color(0xff198B81)),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ListAllHaj()));
                                },
                              ),
                      ],
                    ),
                  ),
                  provider.allAcceptHajs!.length == 0 ||
                          provider.allAcceptHajs!.length == null
                      ? Column(
                          children: [
                            Center(
                              child: Image.asset('assets/images/reg.png'),
                            ),
                            Center(
                                child: Text(
                              'لا يوجد طلبات تسجيل بعد',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18.sp,
                              ),
                            ))
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, i) => RegisterElhaj(
                                    name:
                                        "${provider.listAllHajAcccountForMinistry![0].name1} ${provider.listAllHajAcccountForMinistry![0].name2} ${provider.listAllHajAcccountForMinistry![0].name3} ${provider.listAllHajAcccountForMinistry![0].name4}",
                                    mobile: provider.allAcceptHajs![i].mobile,
                                    sid:
                                        provider.allAcceptHajs![i].main_haj_sid,
                                  )
                              //  provider.getAllAppInfo!
                              //       .map((i) => RegisterElhaj(
                              //             mobile: e.mabile_number,
                              //             sid: e.main_haj_sid,
                              //           ))
                              //       .toList(),
                              ),
                        )
                  // Expanded(
                  //     child: ListView(
                  //       children: provider.allAcceptHajs!
                  //           .map((e) => RegisterElhaj(
                  //                 mobile: e.mobile,
                  //                 sid: e.main_haj_sid,
                  //               ))
                  //           .toList(),
                  //     ),
                  //   )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 40.h,
              ),
              height: 230.h,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Text(
                      ' نداءات الإستغاثة',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD8BA52)),
                    ),
                  ),
                  provider.allSosForMinistry!.length == 0 ||
                          provider.allSosForMinistry!.length == null
                      ? Column(
                          children: [
                            Center(
                              child: Image.asset('assets/images/vol.png'),
                            ),
                            Center(
                                child: Text(
                              'لا يوجد نداءات الإستغاثة بعد',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18.sp,
                              ),
                            ))
                          ],
                        )
                      : Column(
                          children: [
                            Center(
                              child: Image.asset('assets/images/vol.png'),
                            ),
                            Center(
                                child: Text(
                              'يوجد نداءات استغاثة , انتقل لرؤيتهم',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18.sp,
                              ),
                            ))
                          ],
                        )
                ],
              ),
            )
          ],
        ),
        //  }),
      );
    });
  }
}
