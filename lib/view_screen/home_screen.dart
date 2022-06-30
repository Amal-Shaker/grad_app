import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/custom_dialog_widget/sos_dailog.dart';
import 'package:grad_app/custom_dialog_widget/vaccine_dailog.dart';
import 'package:grad_app/helper/auth_helper.dart';
import 'package:grad_app/view_screen/fill_haj_app.dart';
import 'package:grad_app/view_screen/guidelines.dart';
import 'package:grad_app/view_screen/list_masak.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:grad_app/view_screen/mnask_elhaj.dart';
import 'package:grad_app/view_screen/myDates.dart';
import 'package:grad_app/view_screen/passport_info.dart';
import 'package:grad_app/view_screen/selection_page.dart';
import 'package:grad_app/view_screen/tassbeeh_and_supplications.dart';
import 'package:grad_app/widgets/allLista.dart';
import 'package:provider/provider.dart';

import '../custom_dialog_widget/company_dailog.dart';
import '../providers/auth_providers.dart';
import '../widgets/home_icon.dart';
import '../widgets/traivil_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getSingleHajInfo(
        Provider.of<AuthProvider>(context, listen: false).mainHajId);
    Provider.of<AuthProvider>(context, listen: false).getAllAppData();
    Provider.of<AuthProvider>(context, listen: false).getAllHajInfo(
        Provider.of<AuthProvider>(context, listen: false).mainHajId);
    print('statusstatusstatusstatusstatusstatusstatusstatusstatus');

    // if (Provider.of<AuthProvider>(context, listen: false)
    //         .hajInfo!
    //         .social_status ==
    //     1) {
    //   Provider.of<AuthProvider>(context, listen: false).step1 = true;
    //   Provider.of<AuthProvider>(context, listen: false).step2 = true;
    //   Provider.of<AuthProvider>(context, listen: false).step3 = true;
    //   Provider.of<AuthProvider>(context, listen: false).step4 = true;
    //   Provider.of<AuthProvider>(context, listen: false).step5 = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
      return provider.allHajInfo == null
          ? CircularProgressIndicator()
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w),
                    width: MediaQuery.of(context).size.width,
                    height: 239.h,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/rec5.png')),
                        color: const Color(0xff198B81),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.r),
                            bottomRight: Radius.circular(25.r))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("أهلا بك في تطبيق الحج",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Cairo',
                                fontSize: 16.sp)),

                        InkWell(
                          child: const Icon(
                            Icons.campaign_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => SosDailog());
                          },
                        ),

                        // Container(
                        //   height: 150.h,
                        //   width: 200.w,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(400.r),
                        //           topRight: Radius.circular(400.r),
                        //           bottomLeft: Radius.circular(25.r),
                        //           bottomRight: Radius.circular(400.r)),
                        //       color: Colors.red),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeIcon(
                          image: provider.allHajInfo!.status == 0 ||
                                  provider.allHajInfo!.status == null
                              ? 'assets/images/login1.png'
                              : 'assets/images/mnaskIcon.png',
                          name: provider.allHajInfo!.status == 0 ||
                                  provider.allHajInfo!.status == null
                              ? 'التسحيل للحج'
                              : 'مناسك الحج',
                          onTapFunction: provider.allHajInfo!.status == 0 ||
                                  provider.allHajInfo!.status == null
                              ? () {
                                  //ManaskElhaj
                                  // provider.getSingleHajInfo(provider.mainHajId);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (contexr) => FillElhajApp()));
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (contexr) => ListManask()));
                                }
                              : () {
                                  //ManaskElhaj
                                  //provider.getSingleHajInfo(provider.mainHajId);
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (contexr) => FillElhajApp())
                                  //     );
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (contexr) => ManaskElhaj()));
                                }),
                      HomeIcon(
                        image: 'assets/images/dates.png',
                        name: 'مواعيدي',
                        onTapFunction: () {
                          provider.getTafwaijInfo();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyDates()));
                        },
                      ),
                      HomeIcon(
                        image: 'assets/images/instructions.png',
                        name: 'إرشادات الحج',
                        onTapFunction: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Guidelines()));
                        },
                      ),
                      HomeIcon(
                        image: 'assets/images/duas.png',
                        name: 'الأدعية',
                        onTapFunction: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const TassbeehAndSupplication()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Text(
                        'رحلة التسجيل للحج',
                        style: TextStyle(
                            color: const Color(0xFFD8BA52),
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 250.h,
                      width: 318.w,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: provider.allHajInfo!.status == 0 ||
                              provider.allHajInfo!.status == null
                          ? Column(
                              children: [
                                TraivilWidget(
                                  fillColor: provider.step1,
                                  title: 'تعبئة طلب الحج',
                                  fillFunction: () {
                                    provider
                                        .getSingleHajInfo(provider.mainHajId);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (contexr) =>
                                                FillElhajApp()));
                                  },
                                  fillForm: 'تعبئة الطلب',
                                  onTapIcon: () {
                                    provider
                                        .getSingleHajInfo(provider.mainHajId);
                                    provider.step1 == true
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (contexr) =>
                                                    FillElhajApp()))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (contexr) =>
                                                    MainHome()));
                                  },
                                ),
                                TraivilWidget(
                                    fillColor: provider.step2,
                                    title: 'القرعة',
                                    iconVisibal: true,
                                    onTapIcon: () {
                                      provider.step2 == true
                                          ? Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (contexr) =>
                                                      const SelectionPage()))
                                          : MaterialPageRoute(
                                              builder: (contexr) => MainHome());
                                    }),
                                TraivilWidget(
                                  fillColor: provider.step3,
                                  title: 'بيانات الجواز',
                                  onTapIcon: () {
                                    provider.step3 == true
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (contexr) =>
                                                    const PassportInformation()))
                                        : MaterialPageRoute(
                                            builder: (contexr) => MainHome());
                                  },
                                ),
                                TraivilWidget(
                                  fillColor: provider.step4,
                                  title: 'التطعيم',
                                  onTapIcon: () {
                                    provider.getHajVacc(provider.mainHajId);
                                    provider.step4 == true
                                        ? showDialog(
                                            context: context,
                                            builder: (context) =>
                                                VaccineDailog())
                                        : MaterialPageRoute(
                                            builder: (contexr) => MainHome());
                                    provider.step5 = true;
                                  },
                                ),
                                TraivilWidget(
                                  fillColor: provider.step5,
                                  title: 'القبول في الحج نهائيا',
                                  iconVisibal: false,
                                )
                              ],
                            )
                          : ListView(
                              children: mnaskList
                                  .map((e) => Row(
                                        children: [
                                          Expanded(flex: 1, child: cc()),
                                          Expanded(
                                            flex: 10,
                                            child: Card1(
                                              title: e.title,
                                              description: e.description,
                                            ),
                                          ),
                                        ],
                                      ))
                                  .toList(),
                            )
                      //  color: Colors.red,
                      ),
                ],
              ),
            );
    }));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.lineTo(0, h + 50);
    //path.lineTo(w / 2, h);
    path.quadraticBezierTo(0, h + 50, w * .5, h + 100);
    //path.lineTo(w, h + 50);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
//  Stack(
//   children: [
//     ClipPath(
//       clipper: CustomClipPath(),
//       child: Container(
//         color: Colors.red,
//         height: 400,
//       ),
//     )
//   ],
// ),
