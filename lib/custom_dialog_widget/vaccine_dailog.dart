import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class VaccineDailog extends StatelessWidget {
  const VaccineDailog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            height: 455.h,
            width: 345.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: Colors.white,
            ),
            child: provider.hajVaccTime == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Image.asset('assets/images/vaccine.png'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'التطعيم',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF198B81)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '''يرجى التوجه في تاريخ ${provider.hajVaccTime!.vacc_date} في تمام الساعة  ${provider.hajVaccTime!.vacc_time}  صباحاً الى ${provider.hajVaccTime!.vacc_place}  لتلقي التطعيم الخاص بالحج.''',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
