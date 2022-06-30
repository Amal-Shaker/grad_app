import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/widgets/allLista.dart';

class Quran extends StatelessWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 620.h,
      child: ListView(
        children: quran
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
                              image: AssetImage('assets/images/quran.png'))),
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
  }
}
