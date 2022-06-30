import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class ListHaj extends StatelessWidget {
  const ListHaj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: const Color(0xFF198B81),
        title: Text(
          'قائمة الحجاج',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          HajInfo(),
          HajInfo(),
          HajInfo(),
          HajInfo(),
          HajInfo(),
          HajInfo(),
          HajInfo(),
          HajInfo(),
          InkWell(
            child: Text('data'),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false)
                  .getSingleCompanyByUserId();
              // print('pppppppppppppppp');
              // print(Provider.of<AuthProvider>(context, listen: false)
              //     .getAllAppInfo);
            },
          )
        ],
      ),
    );
  }
}

class HajInfo extends StatelessWidget {
  String? mobile;
  int? sid;
  String? name;
  HajInfo({this.mobile, this.sid, name});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.r),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'محمد أحمد علي عليوة',
                textAlign: TextAlign.right,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      color: Color(0xFF198B81),
                    ),
                    Text('$sid'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call_outlined,
                      color: Color(0xFF198B81),
                    ),
                    Text('$mobile'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }
}
