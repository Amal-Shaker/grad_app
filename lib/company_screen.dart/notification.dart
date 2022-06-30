import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCompany extends StatelessWidget {
  const NotificationCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: const Color(0xFF198B81),
        title: Center(
          child: Text(
            'الإشعارات',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const Card(
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_none,
              color: Color(0xFF198B81),
            ),
            // backgroundImage: AssetImage('assets/images/ogaf.png'),
          ),
          title: Text('اسم الإشعار'),
          subtitle:
              Text('محتوى الاشعار هو كالتالي قد تكون الاشعارات في حالة  '),
          trailing: Text('7:05'),
        ),
      ),
    );
  }
}
