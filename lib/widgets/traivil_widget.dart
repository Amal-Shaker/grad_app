import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TraivilWidget extends StatelessWidget {
  String? title;
  String? fillForm;
  bool? iconVisibal;
  Function()? onTapIcon;
  Function()? fillFunction;
  bool? fillColor;
  // ignore: use_key_in_widget_constructors
  TraivilWidget(
      {this.title,
      this.fillForm,
      this.iconVisibal,
      this.onTapIcon,
      this.fillFunction,
      this.fillColor});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Row(
        children: [
          Column(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: BoxDecoration(
                    color: fillColor! ? Color(0xFF198B81) : Colors.grey[200],
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 34.h,
                width: 10.w,
                margin: EdgeInsets.only(bottom: 2.h),
                decoration: BoxDecoration(
                    //  color: const Color(0xFF198B81),
                    color: fillColor! ? Color(0xFF198B81) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Container(
              padding: EdgeInsets.only(bottom: 5.h, top: 5.h, right: 10.w),
              width: 291.w,
              height: 42.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: const Color(0xFFF5F5F5)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      title!,
                      style: TextStyle(
                          color: const Color(0xFF000000),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: fillFunction,
                        child: Text(
                          fillForm ?? '',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                              color: const Color(0xFF198B81)),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Visibility(
                          visible: iconVisibal ?? true,
                          child: InkWell(
                            onTap: onTapIcon,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: fillColor!
                                  ? Color(0xFF198B81)
                                  : Colors.grey[300],
                            ),
                          ),
                        )),
                  ),
                ],
              )),
        ],
      );
    });
  }
}

class TraivilWidget1 extends StatelessWidget {
  String? title;
  String? fillForm;
  bool? iconVisibal;
  Function()? onTapIcon;
  Function()? fillFunction;
  bool? fillColor;
  String? des;
  // ignore: use_key_in_widget_constructors
  TraivilWidget1(
      {this.title,
      this.fillForm,
      this.iconVisibal,
      this.onTapIcon,
      this.fillFunction,
      this.fillColor,
      this.des});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Row(
        children: [
          Column(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: BoxDecoration(
                    color: fillColor! ? Color(0xFF198B81) : Colors.grey[200],
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 34.h,
                width: 10.w,
                margin: EdgeInsets.only(bottom: 2.h),
                decoration: BoxDecoration(
                    //  color: const Color(0xFF198B81),
                    color: fillColor! ? Color(0xFF198B81) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Container(
            //  padding: EdgeInsets.only(bottom: 5.h, top: 5.h, right: 10.w),
            width: 291.w,
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.red, //const Color(0xFFF5F5F5)
            ),
            child:

                //Row(
                //children: [
                // Expanded(
                // flex: 4,
                //  child:
                // Text(
                //   title!,
                //   style: TextStyle(
                //       color: const Color(0xFF000000),
                //       fontFamily: 'Cairo',
                //       fontWeight: FontWeight.normal,
                //       fontSize: 16.sp),
                // ),
                // ),
                //Expanded(
                //flex: 10,
                //  child:

                Directionality(
                    textDirection: TextDirection.ltr,
                    child: DropdownButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.yellow,
                        ),
                        items: <String>[des ?? "dis"]
                            .map<DropdownMenuItem<Widget>>((String value) {
                          return DropdownMenuItem<Widget>(
                            value: Text('${title ?? "tittle"}') //Text(value),
                            ,
                            child: Container(
                                width: 400 //MediaQuery.of(context).size.width,
                                ,
                                child: Text(value)),
                          );
                        }).toList(),
                        onChanged: (e) {})),
            //  ),
            // ],
            //)
          )
        ],
      );
    });
  }
}

class LastDrop extends StatelessWidget {
  const LastDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Expanded(
            child: DropdownButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.yellow,
                ),
                items: <String>["dis"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value //Text(value),
                    ,
                    child: Container(
                        width: 400 //MediaQuery.of(context).size.width,
                        ,
                        child: Text('value')),
                  );
                }).toList(),
                onChanged: (e) {}),
          ),
        ));
  }
}
