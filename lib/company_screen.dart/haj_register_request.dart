import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/company_screen.dart/detail_register.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class HajRegisterRequest extends StatefulWidget {
  @override
  State<HajRegisterRequest> createState() => _HajRegisterRequestState();
}

class _HajRegisterRequestState extends State<HajRegisterRequest> {
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    i = 0;
    print('getAllAppInfogetAllAppInfogetAllAppInfogetAllAppInfo');
    print(Provider.of<AuthProvider>(context, listen: false).getAllAppInfo);
    print(Provider.of<AuthProvider>(context, listen: false)
        .listAllHajAcccountForApp);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: const Color(0xFF198B81),
          title: Center(
            child: Text(
              'طلبات التسجيل للحج',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, g) {
          return provider.getAllAppInfo == null
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'طلبات التسجيل للحج',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD8BA52)),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: provider.getAllAppInfo!.map((e) {
                          return InkWell(
                            onTap: () async {
                              await provider
                                  .getAllHajAndCompinationInfo(e.main_haj_sid!);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsRegister()));
                            },
                            child: RegisterElhaj(
                              mobile: e.mabile_number,
                              sid: e.main_haj_sid,
                              name:
                                  '${provider.listAllHajAcccountForApp![i].name1} ${provider.listAllHajAcccountForApp![i].name2} ${provider.listAllHajAcccountForApp![i].name3} ${provider.listAllHajAcccountForApp![i++].name4}',
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // ListView(
                    //   children: [
                    // RegisterElhaj(), RegisterElhaj(), RegisterElhaj(),
                    // Center(
                    //   child: InkWell(
                    //     child: Text('data'),
                    //     onTap: () async {
                    //       await Provider.of<AuthProvider>(context,
                    //               listen: false)
                    //           .getallSosByCompanyId();
                    //     },
                    //   ),
                    // )
                    //
                    //],
                    // )
                  ],
                ));
        }),
      ),
    );
  }
}

class RegisterElhaj extends StatelessWidget {
  String? mobile;
  int? sid;
  String? name;
  RegisterElhaj({this.mobile, this.sid, this.name});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.r),
              width: MediaQuery.of(context).size.width,
              child: Text(
                '${name}',
                textAlign: TextAlign.right,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      color: Color(0xFF198B81),
                    ),
                    Text('$sid'),
                  ],
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.person_outlined,
                //       color: Color(0xFF198B81),
                //     ),
                //     Text('مرافق 2'),
                //   ],
                // ),
                Row(
                  children: [
                    Icon(
                      Icons.call_outlined,
                      color: Color(0xFF198B81),
                    ),
                    Text('$mobile'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }
}
