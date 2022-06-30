import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/widgets/allLista.dart';

class Sona extends StatelessWidget {
  const Sona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 620.h,
      child: ListView(
        children: sonaa
            .map((e) => Column(children: [
                  ListTile(
                    title: Text(
                      e,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                    trailing: Container(
                      height: 46.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/sona.png'))),
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    height: 10.h,
                  )
                ]))
            .toList(),
      ),
    );

    // return Container(
    //   color: Colors.white,
    //   child: ListTile(
    //     title: Text(
    //         'هو أهم أركان الحج، وقد قال رسول الله صلى الله عليه وسلم: "الحج عرفة".'),
    //     trailing: Container(
    //       height: 46.h,
    //       width: 45.w,
    //       decoration: BoxDecoration(
    //           image:
    //               DecorationImage(image: AssetImage('assets/images/sona.png'))),
    //     ),
    //   ),
    // );
  }
}
