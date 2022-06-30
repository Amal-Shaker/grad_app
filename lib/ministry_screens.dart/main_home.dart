import 'package:flutter/material.dart';
import 'package:grad_app/ministry_screens.dart/home_ministry.dart';
import 'package:grad_app/ministry_screens.dart/message_ministry.dart';
import 'package:grad_app/ministry_screens.dart/sos_ministry.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/evaluation_trip.dart';
import 'package:grad_app/view_screen/home_screen.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/message.dart';
import 'package:grad_app/view_screen/notification_page.dart';
import 'package:grad_app/view_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'haj_register_request_ministry.dart';
import 'notification_ministry.dart';

class MainHomeMinistry extends StatefulWidget {
  static List<Widget> widgetOption = [
    HomeMinistry(),
    MessageMinistry(),
    SosMinistry(),
    ListAllHaj()
    // const MessageCompany(),
    // const NotificationCompany(),
    // HajRegisterRequest()
  ];
  @override
  State<MainHomeMinistry> createState() => _MainHomeMinistryState();
}

class _MainHomeMinistryState extends State<MainHomeMinistry> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<AuthProvider>(context, listen: false)
          .getAllAcceptHajs();
      await Provider.of<AuthProvider>(context, listen: false).getallSos();
    });
  }

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
        body: MainHomeMinistry.widgetOption.elementAt(_selectedIndex),
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
  }
}
