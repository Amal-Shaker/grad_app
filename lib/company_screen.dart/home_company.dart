import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/company_screen.dart/about_company_update.dart';
import 'package:grad_app/company_screen.dart/chat_room_company.dart';
import 'package:grad_app/company_screen.dart/haj_register_request.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:provider/provider.dart';

import 'list_haj.dart';

class HomeCampany extends StatefulWidget {
  @override
  State<HomeCampany> createState() => _HomeCampanyState();
}

class _HomeCampanyState extends State<HomeCampany> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<AuthProvider>(context, listen: false)
          .getallAppByCompanyId(
              Provider.of<AuthProvider>(context, listen: false).companyId!);
      await Provider.of<AuthProvider>(context, listen: false)
          .getallSosByCompanyId();
      await Provider.of<AuthProvider>(context, listen: false).getCountApp();

      await Provider.of<AuthProvider>(context, listen: false).getCountSos();
      await Provider.of<AuthProvider>(context, listen: false)
          .getlistAllHajAcccountForApp(
              Provider.of<AuthProvider>(context, listen: false).getAllAppInfo);
      print(
          ' Provider.of<AuthProvider>(context, listen: false).getAllAppInfo${Provider.of<AuthProvider>(context, listen: false).getAllAppInfo}');
      print(
          'Provider.of<AuthProvider>(context, listen: false)${Provider.of<AuthProvider>(context, listen: false).listAllHajAcccountForApp}');
      setState(() {});
    });
    // Future.delayed(Duration.zero, () {
    //   // print('main id ////////////////////////////');
    //   // print(Provider.of<AuthProvider>(context, listen: false).companyId!);
    //   // Provider.of<AuthProvider>(context, listen: false).getallAppByCompanyId(
    //   //     Provider.of<AuthProvider>(context, listen: false).companyId!);
    //   // Provider.of<AuthProvider>(context, listen: false).getallSosByCompanyId();
    //   // Provider.of<AuthProvider>(context, listen: false).getCountApp();

    //   // Provider.of<AuthProvider>(context, listen: false).getCountSos();
    //   // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

    //   // Provider.of<AuthProvider>(context, listen: false).getCountApp();
    //   // Provider.of<AuthProvider>(context, listen: false).getCountSos();
    //   // Provider.of<AuthProvider>(context, listen: false).getCountSos();
    //   // Provider.of<AuthProvider>(context, listen: false).getCountApp();
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, g) {
      return provider.getAllAppInfo == null ||
              provider.countApp == null ||
              provider.countSos == null
          ? CircularProgressIndicator()
          : Scaffold(
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
                                  const AssetImage('assets/images/company.png'),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '${provider.companyInfoByUserId!.Company_name}',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ListTile(
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
                      // const ListTile(
                      //   leading: Icon(
                      //     Icons.home_outlined,
                      //     color: Colors.white,
                      //   ),
                      //   title: Text(
                      //     'التسكين',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      // Container(
                      //   height: 1.h,
                      //   width: 220.w,
                      //   color: Colors.grey[500],
                      // ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatRoomCompany('00',
                                  '${provider.companyInfoByUserId!.company_id}')));
                        },
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
                      ListTile(
                        onTap: () {
                          provider.CompanyNameController.text =
                              provider.companyInfoByUserId!.Company_name!;
                          provider.companyMobileController.text =
                              provider.companyInfoByUserId!.mobile!;
                          provider.CompanyAboutUsController.text =
                              provider.companyInfoByUserId!.about_us!;
                          provider.CompanyAddressController.text =
                              provider.companyInfoByUserId!.address!;
                          provider.CompanyTelController.text =
                              provider.companyInfoByUserId!.tel!;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutCompanyUpdate()));
                        },
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: const Text(
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
                  // Provider.of<AuthProvider>(context, listen: false).getCountApp();
                  // Provider.of<AuthProvider>(context, listen: false).getCountSos();

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        provider.countSos == null
                                            ? '0'
                                            : '${provider.countSos}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        provider.countApp == null
                                            ? '0'
                                            : '${provider.countApp}',
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
                      padding:
                          EdgeInsets.only(bottom: 40.h, right: 5.w, left: 5.w),
                      height: 230.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
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
                                provider.countApp == null
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HajRegisterRequest()));
                                        },
                                      ),
                              ],
                            ),
                          ),
                          provider.countApp == null
                              ? Column(
                                  children: [
                                    Center(
                                      child:
                                          Image.asset('assets/images/reg.png'),
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
                                      itemBuilder: (context, i) => provider
                                                      .listAllHajAcccountForApp!
                                                      .length ==
                                                  0 ||
                                              provider.getAllAppInfo == null
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : RegisterElhaj(
                                              name:
                                                  "${provider.listAllHajAcccountForApp![0].name1} ${provider.listAllHajAcccountForApp![0].name2} ${provider.listAllHajAcccountForApp![0].name3} ${provider.listAllHajAcccountForApp![0].name4}",
                                              mobile: provider.getAllAppInfo![i]
                                                  .mabile_number,
                                              sid: provider.getAllAppInfo![i]
                                                  .main_haj_sid,
                                            )
                                      //  provider.getAllAppInfo!
                                      //       .map((i) => RegisterElhaj(
                                      //             mobile: e.mabile_number,
                                      //             sid: e.main_haj_sid,
                                      //           ))
                                      //       .toList(),
                                      ),
                                )
                        ],
                      )),
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
                        Center(
                          child: Image.asset('assets/images/vol.png'),
                        ),
                        Center(
                            child: provider.countSos == 0
                                ? Text(
                                    'لا يوجد نداءات الإستغاثة بعد',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 18.sp,
                                    ),
                                  )
                                : Text(
                                    'يوجد نداءات استغاثة , انتقل لرؤيتهم',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 18.sp,
                                    ),
                                  ))
                      ],
                    ),
                  )
                ],
              ));
    });

    //);
  }
}

// class AAAAA extends StatelessWidget {
//   const AAAAA({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.red,
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 40.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40.r,
//                     backgroundImage:
//                         const AssetImage('assets/images/company.png'),
//                   ),
//                   SizedBox(
//                     width: 5.w,
//                   ),
//                   const Text(
//                     'شركة حجازي للحج والعمرة',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'قائمة الحجاج',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.home_outlined,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'التسكين',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.call,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 ' تواصل مع الوزارة',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.star,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'تقييمات الحجاج',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.circle,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 ' عن الشركة',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//             const ListTile(
//               leading: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'تسجيل الخروج',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               height: 1.h,
//               width: 220.w,
//               color: Colors.grey[500],
//             ),
//           ]),
//     );
//   }
// }
