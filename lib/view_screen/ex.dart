import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ex extends StatelessWidget {
  const Ex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // ignore: sort_child_properties_last
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 25.h),
                child: Image.asset('assets/images/rec2.png')),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    margin: EdgeInsets.only(top: 25.h),
                    child: Image.asset('assets/images/rec3.png'))),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    margin: EdgeInsets.only(top: 35.h),
                    child: Image.asset('assets/images/rec4.png'))),
          ],
        ),
        decoration: const BoxDecoration(
            // image:
            //     DecorationImage(image: AssetImage('assets/images/rec1.png')
            color: Color(0xFF0FF198B81)),
      ),
    );
  }
}
