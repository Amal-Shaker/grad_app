import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class AllCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, g) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70.h,
              backgroundColor: const Color(0xFF198B81),
              title: Center(
                child: Text(
                  'قائمة الشركات',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: ListView(
              children: provider.listAllCompany!
                  .map((e) => ListTile(
                        title: Text(e.Company_name!),
                      ))
                  .toList(),
            )),
      );
    });
  }
}
