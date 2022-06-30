import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeIcon extends StatelessWidget {
  // const HomeIcon({Key? key}) : super(key: key);

  String? image;
  String? name;
  Function()? onTapFunction;
  // ignore: use_key_in_widget_constructors
  HomeIcon({this.image, this.name, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapFunction,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              color: Colors.white,
              height: 85.h,
              width: 85.h,
              child: Container(
                  height: 45.h,
                  width: 45.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image!), fit: BoxFit.cover))),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(name!,
                style: TextStyle(
                    color: const Color(0xFF198B81),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp)),
          ],
        ),
      ),
    );
  }
}
