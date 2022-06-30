import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/traivil_widget.dart';
import 'package:grad_app/widgets/allLista.dart';

class ListManask extends StatelessWidget {
  const ListManask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: const Color(0xFF198B81),
          title: Center(
            child: Text(
              'المناسك',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(right: 0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Text(
                  'مناسك الحج الأساسية',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Color(0xFF198B81),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                  children: mnaskList
                      .map((e) => Row(
                            children: [
                              Expanded(flex: 1, child: cc()),
                              Expanded(
                                flex: 10,
                                child: Card1(
                                  title: e.title,
                                  description: e.description,
                                ),
                              ),
                            ],
                          ))
                      .toList())
            ],
          ),
        )),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  String? title;
  String? description;
  Card1({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), color: Colors.grey[200]),
      child: Column(
        children: [
          ScrollOnExpand(
              child: ExpandablePanel(
            theme: ExpandableThemeData(iconColor: Color(0xFF198B81)),
            header: Text(
              title!,
              style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.sp),
            ),
            collapsed: const Text(''),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //  for (var _ in Iterable.generate(5))
                Text(description!,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp)),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}

class cc extends StatelessWidget {
  const cc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
              color: Color(0xFF198B81),
              // color: Colors.red,
              borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 70.h,
          width: 10.w,
          margin: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
              //  color: const Color(0xFF198B81),
              color: Color(0xFF198B81),
              borderRadius: BorderRadius.circular(5)),
        )
      ],
    );
  }
}
