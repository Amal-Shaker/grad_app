import 'package:flutter/material.dart';
import 'package:grad_app/company_screen.dart/about_company.dart';
import 'package:grad_app/company_screen.dart/detail_register.dart';
import 'package:grad_app/company_screen.dart/haj_register_request.dart';
import 'package:grad_app/company_screen.dart/home_company.dart';
import 'package:grad_app/company_screen.dart/list_haj.dart';
import 'package:grad_app/company_screen.dart/message.dart';
import 'package:grad_app/company_screen.dart/notification.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/evaluation_trip.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/message.dart';
import 'package:grad_app/view_screen/notification_page.dart';
import 'package:grad_app/view_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainHome extends StatefulWidget {
  // int? status =
  // Provider.of<AuthProvider>(, listen: false).hajInfo!.social_status;
  static List<Widget> widgetOption = [
    const HomeScreen(),
    //AboutCompany(),
    const Message(),
    const NotificationPage(),
    EvaluationTrip()
  ];
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: MainHome.widgetOption.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          unselectedLabelStyle: TextStyle(fontFamily: 'Cairo', fontSize: 13.sp),
          selectedItemColor: const Color(0xFF198B81),
          unselectedItemColor: const Color(0xFF08855F),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1 ? Icons.messenger : Icons.messenger_outline,
              ),
              label: 'الرسائل',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.notifications
                    : Icons.notifications_outlined,
              ),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.location_on
                  : Icons.location_on_outlined),
              label: 'الموقع',
            ),
          ],
        ),
      ),
    );
  }
}
