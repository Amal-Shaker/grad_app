import 'package:flutter/material.dart';
import 'package:grad_app/company_screen.dart/about_company.dart';
import 'package:grad_app/company_screen.dart/haj_register_request.dart';
import 'package:grad_app/company_screen.dart/home_company.dart';
import 'package:grad_app/company_screen.dart/message.dart';
import 'package:grad_app/company_screen.dart/notification.dart';
import 'package:grad_app/company_screen.dart/sos_company.dart';
import 'package:grad_app/view_screen/evaluation_trip.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/message.dart';
import 'package:grad_app/view_screen/notification_page.dart';
import 'package:grad_app/view_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class MainHomeCompany extends StatefulWidget {
  static List<Widget> widgetOption = [
    HomeCampany(),
    const MessageCompany(),
    SosCompany(),
    HajRegisterRequest()
  ];
  @override
  State<MainHomeCompany> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHomeCompany> {
  int _selectedIndex = 0;
  //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<AuthProvider>(context, listen: false)
          .getSingleCompanyByUserId();
      // print('main id ////////////////////////////');
      // print(Provider.of<AuthProvider>(context, listen: false).companyId!);
      //  Provider.of<AuthProvider>(context, listen: false)
      //     .getallAppByCompanyId(
      //         Provider.of<AuthProvider>(context, listen: false).companyId!);
      // Provider.of<AuthProvider>(context, listen: false).getallSosByCompanyId();
      // Provider.of<AuthProvider>(context, listen: false).getCountApp();

      // Provider.of<AuthProvider>(context, listen: false).getCountSos();
      // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      // print(Provider.of<AuthProvider>(context, listen: false).getAllAppInfo);
      // print(Provider.of<AuthProvider>(context, listen: false).getAllSosInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, g) {
      return provider.companyInfoByUserId == null
          ? AboutCompany()
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: MainHomeCompany.widgetOption.elementAt(_selectedIndex),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _selectedIndex, //New
                  onTap: _onItemTapped,
                  unselectedLabelStyle:
                      TextStyle(fontFamily: 'Cairo', fontSize: 13.sp),
                  selectedItemColor: const Color(0xFF198B81),
                  unselectedItemColor: const Color(0xFF08855F),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        _selectedIndex == 0
                            ? Icons.home_filled
                            : Icons.home_outlined,
                      ),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        _selectedIndex == 1
                            ? Icons.messenger
                            : Icons.messenger_outline,
                      ),
                      label: 'الرسائل',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        _selectedIndex == 2
                            ? Icons.volume_up
                            : Icons.volume_up_outlined,
                      ),
                      label: 'نداءات الإستغاثة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(_selectedIndex == 3
                          ? Icons.file_open
                          : Icons.file_open_outlined),
                      label: 'الطلبات',
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
