import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:grad_app/helper/auth_helper.dart';
import 'package:grad_app/helper/firestore_helper.dart';
import 'package:grad_app/providers/auth_providers.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoom extends StatefulWidget {
  // static final routeName = 'chatpage';
  String toId;
  ChatRoom(this.toId);
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  String? twoId;
  sendToFirestore() async {
    value.clear();
    await FirestoreHelper.firestoreHelper.addMessageChatRoom(
        {
          'message': this.message,
          'dateTime': DateTime.now(),
          'ToId': widget.toId,
        },
        twoId!,
        Provider.of<AuthProvider>(context, listen: false)
            .mainHajId!
            .toString());
  }

  ScrollController scrollController = ScrollController();

  TextEditingController value = TextEditingController();

  String? message;
  @override
  void initState() {
    method();

    // TODO: implement initState
    super.initState();
    print('chatchat');
    FirestoreHelper.firestoreHelper.getAllChatDoc();
  }

  method() {
    // int toId = widget.toId.codeUnitAt(0);
    // int fromId = Provider.of<AuthProvider>(context, listen: false)
    //     .mainHajId!
    //     .toString()
    //     .codeUnitAt(0);
    int toId = int.parse(widget.toId);
    int fromId = Provider.of<AuthProvider>(context, listen: false).mainHajId!;

    print('fromId$fromId');
    print("toId$toId");

    if (toId <= fromId) {
      twoId = widget.toId + fromId.toString();
    } else {
      twoId = fromId.toString() + widget.toId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التواصل مع الشركة'),
        backgroundColor: Color(0xFF198B81),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, index) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirestoreHelper.firestoreHelper
                        .getFirestoreStreamChatRoom(twoId!),
                    builder: (context, datasnapsht) {
                      if (!datasnapsht.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF198B81),
                          ),
                        );
                      } else {
                        Future.delayed(Duration(milliseconds: 100))
                            .then((value) {
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        });
                        QuerySnapshot<Map<String, dynamic>> querySnapShot =
                            datasnapsht.data!;
                        List<Map> messages =
                            querySnapShot.docs.map((e) => e.data()).toList();
                        messages.sort((a, b) => a['dateTime']
                            .toString()
                            .compareTo(b['dateTime'].toString()));
                        return ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return messages[index]['From'] ==
                                      provider.mainHajId.toString().trim()
                                  ? Container(
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width *
                                              0.7,
                                          maxHeight:
                                              MediaQuery.of(context).size.height *
                                                  0.3),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 10, right: 80),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(0xFF198B81)),
                                      child: Text(
                                        "${messages[index]['message']}",
                                        style: TextStyle(color: Colors.black38),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.of(context).size.width *
                                                  0.7,
                                          maxHeight:
                                              MediaQuery.of(context).size.height *
                                                  0.3),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 80),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white38),
                                      child: Text(
                                        "${messages[index]['message']}",
                                        style: TextStyle(color: Colors.black),
                                      ));
                            });
                      }
                    },
                  ),
                )),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey[200]
                              // border: Border.all(color: Colors.black),
                              // borderRadius: BorderRadius.circular(15)

                              ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: TextField(
                                      controller: value,
                                      onChanged: (x) {
                                        this.message = x;

                                        x = this.value.text;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF198B81),
                                        borderRadius:
                                            BorderRadius.circular(25.r)),
                                    child: Transform.rotate(
                                      angle: 150 * pi / 180,
                                      child: InkWell(
                                        onTap: () {
                                          sendToFirestore();
                                        },
                                        child: Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 20.r,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),

                          //  Row(
                          // children: [
                          // Expanded(
                          //     child: TextField(
                          //   controller: value,
                          //   onChanged: (x) {
                          //     this.message = x;

                          //     x = this.value.text;
                          //   },
                          //   decoration: InputDecoration(
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide.none)),
                          // )),
                          //  ],
                          //  ),
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: IconButton(
                      //       onPressed: () {
                      //         sendToFirestore();
                      //       },
                      //       icon: Icon(Icons.send)),
                      // ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(3.0),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 80.h,
                //     color: Colors.white,
                //     margin: EdgeInsets.only(
                //         top: MediaQuery.of(context).size.height - 165.h),
                //     child: Container(
                //       margin: EdgeInsets.only(
                //           right: 20.w, left: 20.w, top: 10.h, bottom: 20.h),
                //       padding: EdgeInsets.symmetric(horizontal: 10.w),
                //       height: 30.h,
                //       width: MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(25.r),
                //           color: Colors.grey[200]),
                //       child: Row(
                //         children: [
                //           Expanded(flex: 7, child: Text('اكتب رسائلك هنا')),
                //           Expanded(
                //             flex: 1,
                //             child: Container(
                //                 height: 40.h,
                //                 width: 40.w,
                //                 decoration: BoxDecoration(
                //                     color: Color(0xFF198B81),
                //                     borderRadius: BorderRadius.circular(25.r)),
                //                 child: Transform.rotate(
                //                   angle: 150 * pi / 180,
                //                   child: Icon(
                //                     Icons.send,
                //                     color: Colors.white,
                //                     size: 20.r,
                //                   ),
                //                 )),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
