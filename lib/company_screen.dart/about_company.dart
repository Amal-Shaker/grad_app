import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/custom_dialog_widget/company_dailog.dart';
import 'package:grad_app/custom_dialog_widget/end_sos_dailog.dart';
import 'package:grad_app/custom_dialog_widget/sos_dailog.dart';
import 'package:grad_app/custom_dialog_widget/vaccine_dailog.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class AboutCompany extends StatefulWidget {
  const AboutCompany({Key? key}) : super(key: key);

  @override
  State<AboutCompany> createState() => _AboutCompanyState();
}

class _AboutCompanyState extends State<AboutCompany> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   Provider.of<AuthProvider>(context, listen: false)
    //       .getSingleCompanyByUserId();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color(0xFF198B81),
          title: Text(
            'عن الشركة',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    'شعار الشركة',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => VaccineDailog());
                          },
                          child: Icon(
                            Icons.add,
                            color: const Color(0xFF198B81),
                          ),
                        ),
                        Text(
                          'حمل صورة إشعار',
                          style: TextStyle(color: const Color(0xFF198B81)),
                        )
                      ],
                    )),
                // CompnyInfoFill(
                //   title: 'اسم الشركة',
                //   controller: provider.CompanyNameController,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    'اسم الشركة',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.CompanyNameController,
                    decoration: InputDecoration(
                        hintText: 'اسم الشركة', border: InputBorder.none),
                  ),
                ),
                // CompnyInfoFill(
                //   title: 'رقم الجوال',
                //   controller: provider.companyMobileController,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    'رقم الجوال',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.companyMobileController,
                    decoration: InputDecoration(
                        hintText: 'رقم الجوال', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // CompnyInfoFill(
                //   title: 'رقم الهاتف',
                //   controller: provider.CompanyTelController,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    'رقم الهاتف',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.CompanyTelController,
                    decoration: InputDecoration(
                        hintText: 'رقم الهاتف', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // CompnyInfoFill(
                //   title: 'العنوان',
                //   controller: provider.CompanyAddressController,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    ' العنوان',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.CompanyAddressController,
                    decoration: InputDecoration(
                        hintText: 'العنوان', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    'نبذة عن الشركة',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        color: const Color(0xFF198B81),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  height: 130.h,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: provider.CompanyAboutUsController,
                    decoration: InputDecoration(
                        hintText: 'نبذة عن الشركة', border: InputBorder.none),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFFD8BA52),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          ' حفظ البيانات',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: const Color(0xFFFFFFFF),
                              fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    provider.postCompanyInfo(context);
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CompnyInfoFill extends StatelessWidget {
  String? title;
  var controllor;
  CompnyInfoFill({this.title, TextEditingController? controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(right: 5.w),
          child: Text(
            '$title',
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                color: const Color(0xFF198B81),
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.r)),
          child: TextField(
            controller: controllor,
            decoration:
                InputDecoration(hintText: '$title', border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

// class Dalohh extends StatelessWidget {
//   const Dalohh({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 250.h,
//         width: 250.w,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Text('data'),
//             Text('data'),
//             Text('data'),
//             Text('data'),
//             Text('data'),
//           ],
//         ),
//       ),
//     );
//   }
// }
