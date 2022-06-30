import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluationTrip extends StatelessWidget {
  Object? val = -1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF198B81),
          title: Center(
              child: Text(
            'تقييم الرحلة',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage('assets/images/ev_image.png'),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.all(15.h),
                child: Text(
                  'تقبل الله أعمالكم وأفعالكم بكل خير وأعادكم إلى أهلكم سالمين غانمين يا حجاج بيت الله، حج مبرور وسعي مشكور وذنب مغفور يا رب.',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 10.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'تقييم رحلة الحج',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD8BA52)),
                  textAlign: TextAlign.left,
                ),
              ),
              question('هل واجهتك صعوبة النتقل '),
              question('هل هناك تقصير من الشركة '),
              question('هل واجهت مشاكل اكتب  بالاسفل'),
              question('هل كان أداء الشركة مناسب '),
              question('هل تريد إعادة الرحلة مع نفس الشركة '),
              question('هل تنصح اصدقائك بالذهاب مع نفس الشركة '),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 10.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'هل لديك أي ملاحظات تود ابلاغنا بها',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 16.sp),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                padding: EdgeInsets.only(right: 5.w),
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.r)),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'اكتب ملاحظاتك هنا', border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget question(String? q) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 3.w),
    child: Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '$q ',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 14.sp),
            )),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                value: 3,
                groupValue: -1,
                onChanged: (value) {
                  // setState(() {
                  //   val = value;
                  // });
                },
                activeColor: Colors.green,
              ),
              Text('لا')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                value: 3,
                groupValue: -1,
                onChanged: (value) {
                  // setState(() {
                  //   val = value;
                  // });
                },
                activeColor: Colors.green,
              ),
              Text('نعم')
            ],
          ),
        ),
      ],
    ),
  );
}
