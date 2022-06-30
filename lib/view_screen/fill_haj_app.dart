import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/custom_dialog_widget/prossesResult.dart';
import 'package:grad_app/model/company.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/add_follower.dart';
import 'package:provider/provider.dart';

import '../custom_dialog_widget/company_dailog.dart';

class FillElhajApp extends StatefulWidget {
  @override
  State<FillElhajApp> createState() => _FillElhajAppState();
}

class _FillElhajAppState extends State<FillElhajApp> {
  Company? selectCompany;
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).getAllCompany();

    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80.h,
              backgroundColor: const Color(0xFF198B81),
              title: Center(
                child: Text(
                  'تعبئة طلب الحج',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: provider.hajInfo == null
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   height: 100.h,
                        //   width: MediaQuery.of(context).size.width,
                        //   color: const Color(0xFF198B81),
                        //   // color: Colors.red,
                        //   child: Center(
                        //     child:
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          // color: Colors.red,
                          height: MediaQuery.of(context).size.height - 110.h,
                          width: MediaQuery.of(context).size.width,
                          //margin: EdgeInsets.only(top: 110.h),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/info_haj.png'))),
                                        ),
                                        Text(
                                          'بيانات الحاج',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF198B81)),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: const Color(0xFFD8BA52),
                                      ),
                                      height: 4.h,
                                      width: 74.w,
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/add_follower.png'))),
                                        ),
                                        Text(
                                          'إضافة مرافق',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: Colors.grey[400]),
                                      height: 4.h,
                                      width: 74.w,
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/send_form.png'))),
                                        ),
                                        Text(
                                          'إرسال الطلب ',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF24241C)),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'الاسم',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 16.sp,
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50.h,
                                          padding: EdgeInsets.only(
                                              right: 10.w, top: 10.h),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Text(
                                              '${provider.hajInfo!.name1}  ${provider.hajInfo!.name2}  ${provider.hajInfo!.name3}  ${provider.hajInfo!.name4}'),
                                          // child:
                                          // TextField(
                                          //   // obscuringCharacter:
                                          //   //     provider.hajInfo!.name1.toString(),
                                          //   decoration:
                                          //       InputDecoration(border: InputBorder.none),
                                          // ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'تاريخ الميلاد',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 16.sp,
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child:
                                                Text('${provider.hajInfo!.dob}')
                                            // const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            // ),
                                            ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10.w),
                                          child: Text(
                                            'اسم الأم',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 16.sp,
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Text(
                                                '${provider.hajInfo!.mother_name}')
                                            //  const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            // ),
                                            ),
                                      ],
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'المنطقة الحالية ',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: 'Cairo',
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Text(
                                                "${provider.hajInfo!.area}")
                                            // const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            //),
                                            ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'الجنس',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: 'Cairo',
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Text(
                                                "${provider.hajInfo!.gender}")
                                            // const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            // ),
                                            ),
                                      ],
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'مكان الميلاد',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 16.sp,
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Text(
                                                "${provider.hajInfo!.birth_place}")
                                            //  const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            // ),
                                            ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: Text(
                                            'الحالة الاجتماعية',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: 'Cairo',
                                                color: const Color(0xFF198B81),
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.h,
                                            padding: EdgeInsets.only(
                                                right: 10.w, top: 10.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Text(
                                                '${provider.hajInfo!.social_status!}')
                                            // Text(
                                            //     "${provider.hajInfo!.haj_relationship}")
                                            // const TextField(
                                            //   decoration:
                                            //       InputDecoration(border: InputBorder.none),
                                            // ),
                                            ),
                                      ],
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5.r)),
                                  width: MediaQuery.of(context).size.width,
                                  child: DropdownButton<Company>(
                                    isExpanded: true,
                                    value: selectCompany,
                                    // value: provider.companyInfoById ?? null,
                                    iconEnabledColor: const Color(0xFF198B81),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    onChanged: (Company? newValue) {
                                      setState(() {
                                        selectCompany = newValue!;
                                        provider.companyInfoById = newValue;
                                      });

                                      setState(() {
                                        provider.getSingleCompany(provider
                                            .companyInfoById!.company_id);
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CompanyDetailDaliog());
                                      });
                                    },
                                    items: provider.listAllCompany!
                                        .map((Company value) {
                                      return DropdownMenuItem<Company>(
                                        value: value,
                                        child: InkWell(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.storefront_outlined,
                                                  color: Color(0xFF198B81),
                                                ),
                                                Text(value.Company_name ?? ''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 3.w),
                                    child: TextField(
                                      controller:
                                          provider.mobileNumberController,
                                      decoration: InputDecoration(
                                          hintText: 'رقم الجوال(اختياري)',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: TextField(
                                      controller: provider.addressController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'الشارع أو رقم المنزل (اختياري)',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                // Container(
                                //   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                //   decoration: BoxDecoration(
                                //       color: Colors.grey[200],
                                //       borderRadius: BorderRadius.circular(5.r)),
                                //   child: Padding(
                                //     padding:  EdgeInsets.only(right: 5.w),
                                //     child: TextField(
                                //       decoration: InputDecoration(
                                //           hintText: 'رقم الجوال المحرم ',
                                //           hintStyle: TextStyle(color: Color(0xFF2c698d)),
                                //           border: InputBorder.none),
                                //     ),
                                //   ),
                                // ),
                                InkWell(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF198B81),
                                          // gradient: LinearGradient(
                                          //     begin: Alignment.centerLeft,
                                          //     end: Alignment.centerRight,
                                          //     colors: <Color>[
                                          //       Color(0xFF2C698D),
                                          //       Color(0xFF79A8CF)
                                          //     ]),
                                          //color: colors.LinearGradient(colors: [colors]),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Center(
                                          child: Text(
                                        'التالي ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 20.sp),
                                      ))),
                                  onTap: () {
                                    provider.postHajAppFill(
                                        provider.mainHajId!,
                                        selectCompany!.company_id!,
                                        selectCompany!.Company_name!,
                                        context);

                                    showDialog(
                                        context: context,
                                        builder: (context) => Result());

                                    //provider.getAllCompany();
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => AddFollower()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
      );
    });
  }
}
