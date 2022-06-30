import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/view_screen/list_masak.dart';

class ManaskElhaj extends StatelessWidget {
  const ManaskElhaj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListManask()));
                },
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ))
          ],
          toolbarHeight: 80.h,
          backgroundColor: const Color(0xFF198B81),
          title: Center(
            child: Text(
              'مناسك الحج',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/mmm.jpg'))),
        ),
      ),
    );
  }
}
