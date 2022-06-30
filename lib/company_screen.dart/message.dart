import 'package:flutter/material.dart';
import 'package:grad_app/chat/chat_room.dart';
import 'package:grad_app/company_screen.dart/chat_room_company.dart';
import 'package:grad_app/helper/firestore_helper.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/communicate_with_company.dart';
import 'package:grad_app/view_screen/comunication_with_ministry.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MessageCompany extends StatelessWidget {
  const MessageCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            backgroundColor: const Color(0xFF198B81),
            title: Center(
              child: Text(
                'قائمة الرسائل',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // appBar: AppBar(
          //   toolbarHeight: 60.h,
          //   backgroundColor: const Color(0xFF198B81),
          //   title: Center(
          //     child: Text(
          //       'الرسائل',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontFamily: 'Cairo',
          //           fontSize: 16.sp,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              // Row(
              //   children: [
              //     const Expanded(
              //         flex: 1,
              //         child: Icon(
              //           Icons.menu,
              //           color: Color(0xFF198B81),
              //         )),
              //     Expanded(
              //       flex: 8,
              //       child: Container(
              //         width: MediaQuery.of(context).size.width,
              //         margin: EdgeInsets.only(left: 10.w),
              //         height: 45.h,
              //         color: Colors.white,
              //         child: Container(
              //           padding: EdgeInsets.only(right: 10.w),
              //           height: 30.h,
              //           width: MediaQuery.of(context).size.width,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(5.r),
              //               color: Colors.grey[200]),
              //           child: Row(
              //             children: [
              //               // Expanded(flex: 7, child: Text(' بحث')),
              //               // Expanded(
              //               //   flex: 1,
              //               //   child: Container(
              //               //       height: 50.h,
              //               //       width: 40.w,
              //               //       decoration: BoxDecoration(
              //               //           color: Color(0xFFD8BA52),
              //               //           borderRadius: BorderRadius.circular(5.r)),
              //               //       child: Icon(
              //               //         Icons.search,
              //               //         color: Colors.white,
              //               //         size: 20.r,
              //               //       )),
              //               // )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // SizedBox(
              //   height: 10.h,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 3.h,
              //   color: Colors.grey[200],
              // ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 10.h),
                child: Text(
                  'الرسائل',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD8BA52)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              provider.getAllAppInfo == null
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView(
                          children: provider.getAllAppInfo!
                              .map(
                                (e) => InkWell(
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.green[800],
                                        // backgroundImage:
                                        //     AssetImage('assets/images/company.png'),
                                      ),
                                      title: Text('${e.main_haj_sid}'),
                                      subtitle: Text('السلام عليكم '),
                                      trailing: Text('7:05'),
                                    ),
                                  ),
                                  onTap: () async {
                                    // await FirestoreHelper.firestoreHelper
                                    //     .getAllChatDoc();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChatRoomCompany(
                                                    '${e.main_haj_sid}',
                                                    '${e.company_id}')));
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => const CommunicateWithCompany()));
                                  },
                                ),
                              )
                              .toList()
                          //  InkWell(
                          //   child: Card(
                          //     elevation: 3,
                          //     child: ListTile(
                          //       leading: CircleAvatar(
                          //         backgroundImage: AssetImage('assets/images/company.png'),
                          //       ),
                          //       title: Text('${provider.companyInfoById!.Company_name}'),
                          //       subtitle: Text('السلام عليكم '),
                          //       trailing: Text('7:05'),
                          //     ),
                          //   ),
                          //   onTap: () async {
                          //     await FirestoreHelper.firestoreHelper.getAllChatDoc();
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) =>
                          //             ChatRoom('${provider.companyInfoById!.company_id}')));
                          //     // Navigator.of(context).push(MaterialPageRoute(
                          //     //     builder: (context) => const CommunicateWithCompany()));
                          //   },
                          // ),
                          ),
                    ),
              // InkWell(
              //   child: const Card(
              //     elevation: 3,
              //     child: ListTile(
              //       // leading: CircleAvatar(
              //       //   backgroundImage: AssetImage('assets/images/ogaf.png'),
              //       // ),
              //       title: Text('اسم المرسل '),
              //       subtitle:
              //           Text('السلام عليكم  اريد السؤال عن المستندات المطلوبة'),
              //       trailing: Text('7:05'),
              //     ),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const CommunicateWithMinistry()));
              //   },
              // ),
              // InkWell(
              //   child: const Card(
              //     elevation: 3,
              //     child: ListTile(
              //       title: Text('اسم المرسل'),
              //       subtitle:
              //           Text('السلام عليكم  اريد السؤال عن المستندات المطلوبة '),
              //       trailing: Text('7:05'),
              //     ),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const CommunicateWithCompany()));
              //   },
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right: 15.w),
              //   child: Row(
              //     children: [
              //       Image.asset('assets/images/ogaf.png'),
              //       SizedBox(
              //         width: 10.w,
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Text('وزارة الأوقاف'),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: const [
              //               Expanded(
              //                   flex: 5,
              //                   child: Expanded(
              //                       flex: 1, child: Text('السلام عليكم '))),
              //               Text('7:05')
              //             ],
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              // Padding(
              //   padding: EdgeInsets.only(right: 15.w),
              //   child: Row(
              //     children: [
              //       Image.asset('assets/images/company.png'),
              //       SizedBox(
              //         width: 10.w,
              //       ),
              //       Column(
              //         children: [
              //           Text(
              //             'وزارة الأوقاف',
              //             style: TextStyle(
              //                 fontFamily: 'Cairo',
              //                 fontSize: 14.sp,
              //                 color: Colors.black),
              //           ),
              //           const Text('السلام عليكم ')
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20.w),
              //   height: 3.h,
              //   color: Colors.grey[200],
              // ),
            ],
          ),
        ),
      );
    });
  }
}
