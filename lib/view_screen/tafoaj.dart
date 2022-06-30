import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class Tafoaj extends StatelessWidget {
  const Tafoaj({Key? key}) : super(key: key);
//getAllTafwaijInfo
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Column(
        children: [
          Card(
            elevation: 3,
            shadowColor: Color(0xFF08855F),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' تجمع الحجاج في غزة',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD8BA52)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${provider.getAllTafwaijInfo![0].dateTime!.split(' ')[0]}',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.sp,
                              color: Color(0xFF198B81)),
                        ),
                        Text(
                            '${provider.getAllTafwaijInfo![0].dateTime!.split(' ')[1]}',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 14.sp,
                                color: Color(0xFF198B81)))
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${provider.getAllTafwaijInfo![0].body}',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          color: Color(0xFF24241C)))
                ],
              ),
            ),
          ),
          Card(
            elevation: 3,
            shadowColor: Color(0xFF08855F),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تجمع الحجاج في مصر',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD8BA52)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${provider.getAllTafwaijInfo![0].dateTime!.split(' ')[0]}',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.sp,
                              color: Color(0xFF198B81)),
                        ),
                        Text(
                            '${provider.getAllTafwaijInfo![0].dateTime!.split(' ')[1]}',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 14.sp,
                                color: Color(0xFF198B81)))
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${provider.getAllTafwaijInfo![1].body}',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          color: Color(0xFF24241C)))
                ],
              ),
            ),
          ),
          Card(
            elevation: 3,
            shadowColor: Color(0xFF08855F),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تجمع الحجاج في السعودية',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD8BA52)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${provider.getAllTafwaijInfo![2].dateTime!.split(' ')[0]}',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.sp,
                              color: Color(0xFF198B81)),
                        ),
                        Text(
                            '${provider.getAllTafwaijInfo![2].dateTime!.split(' ')[1]} ',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 14.sp,
                                color: Color(0xFF198B81)))
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${provider.getAllTafwaijInfo![2].body}',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          color: Color(0xFF24241C))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${provider.getAllTafwaijInfo![3].dateTime!.split(' ')[0]}',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.sp,
                              color: Color(0xFF198B81)),
                        ),
                        Text(
                            '${provider.getAllTafwaijInfo![3].dateTime!.split(' ')[1]}',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 14.sp,
                                color: Color(0xFF198B81)))
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${provider.getAllTafwaijInfo![3].body}',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          color: Color(0xFF24241C)))
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
