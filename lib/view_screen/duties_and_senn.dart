import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/widgets/allLista.dart';

class DutiesAndSenn extends StatelessWidget {
  const DutiesAndSenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 620.h,
      child: ListView(
        children: dutiesElhaj
            .map((e) => Column(children: [
                  ListTile(
                    title: Text(
                      e.title!,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Color(0xFF198B81)),
                    ),
                    subtitle: Text(
                      e.description!,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          // fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    height: 10.h,
                  )
                ]))
            .toList(),
      ),
    );
    // return ListView(
    //   children: [
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(bottom: 10.h),
    //       child: ListTile(
    //         title: Text(
    //           'واجبات وسنن',
    //           style: TextStyle(
    //               fontFamily: 'Cairo',
    //               color: Color(0xff198B81),
    //               fontSize: 16.sp),
    //         ),
    //         subtitle: const Text(
    //             'لقوله (صلى الله عليه وسلم): «إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ»'),
    //       ),
    //     ),
    //   ],
    // );
  }
}
