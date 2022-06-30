import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/company_screen.dart/detail_register.dart';
import 'package:grad_app/company_screen.dart/haj_register_request.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class ListAllHaj extends StatelessWidget {
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
              'قائمة الحجاج',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, g) {
          return provider.countApp == 0
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
                        'لا يوجد حجاج المقبولين بعد',
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
                        ' قائمة الحجاج',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD8BA52)),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: provider.allAcceptHajs!
                            .map((e) => InkWell(
                                  onTap: () async {
                                    await provider.getAllHajAndCompinationInfo(
                                        e.main_haj_sid!);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsRegister()));
                                  },
                                  child: RegisterElhaj(
                                    name:
                                        "${e.name1} ${e.name2} ${e.name3} ${e.name4} ",
                                    mobile: e.mobile,
                                    sid: e.main_haj_sid,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    // ListView(
                    //   children: [
                    // RegisterElhaj(), RegisterElhaj(), RegisterElhaj(),
                    // Center(
                    //   child: InkWell(
                    //     child: Text('data'),
                    //     onTap: () async {
                    //       // await Provider.of<AuthProvider>(context,
                    //       //         listen: false)
                    //       //     .getallSosByCompanyId();
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

// class RegisterElhaj extends StatelessWidget {
//   const RegisterElhaj({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           Container(
//               padding: EdgeInsets.all(10.r),
//               width: MediaQuery.of(context).size.width,
//               child: Text(
//                 'محمد أحمد علي عليوة',
//                 textAlign: TextAlign.right,
//               )),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.file_open_outlined,
//                       color: Color(0xFF198B81),
//                     ),
//                     Text('123456789'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.person_outlined,
//                       color: Color(0xFF198B81),
//                     ),
//                     Text('مرافق 2'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.call_outlined,
//                       color: Color(0xFF198B81),
//                     ),
//                     Text('123456789'),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15.h,
//           )
//         ],
//       ),
//     );
//   }
// }
