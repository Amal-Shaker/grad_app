import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/chat/chat_room.dart';
import 'package:grad_app/helper/firestore_helper.dart';
import 'package:grad_app/view_screen/communicate_with_company.dart';
import 'package:grad_app/view_screen/comunication_with_ministry.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getAllAppData();
    Provider.of<AuthProvider>(context, listen: false).getSingleCompany(
        Provider.of<AuthProvider>(context, listen: false).companyHajId);
    // print("gggggg");
    // print(Provider.of<AuthProvider>(context, listen: false).companyInfoById);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return provider.companyInfoById == null
          ? CircularProgressIndicator()
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 60.h,
                  backgroundColor: const Color(0xFF198B81),
                  title: Center(
                    child: Text(
                      'الرسائل',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, top: 10.h),
                      child: Text(
                        'الرسائل',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF9A7E37)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      child: const Card(
                        elevation: 3,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/ogaf.png'),
                          ),
                          title: Text('وزارة الأوقاف'),
                          // subtitle: Text('السلام عليكم '),
                          // trailing: Text('7:05'),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatRoom('00')));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         const CommunicateWithMinistry()));
                      },
                    ),
                    InkWell(
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/company.png'),
                          ),
                          title:
                              Text('${provider.companyInfoById!.Company_name}'),
                          // subtitle: Text('السلام عليكم '),
                          // trailing: Text('7:05'),
                        ),
                      ),
                      onTap: () {
                        //  await FirestoreHelper.firestoreHelper.getAllChatDoc();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatRoom(
                                '${provider.companyInfoById!.company_id}')));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const CommunicateWithCompany()));
                      },
                    ),
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
