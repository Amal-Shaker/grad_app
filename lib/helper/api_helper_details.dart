import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grad_app/company_screen.dart/main_home.dart';
import 'package:grad_app/ministry_screens.dart/main_home.dart';
import 'package:grad_app/model/compination.dart';
import 'package:grad_app/model/user_info.dart';
import 'package:grad_app/providers/auth_providers.dart';
import 'package:grad_app/view_screen/add_follower.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';
import 'package:provider/provider.dart';

import '../company_screen.dart/about_company.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  Dio dio = Dio();

  Future registerApi(String sid, String email, String password) async {
    String url = 'https://elhaj.000webhostapp.com/api/register';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'aapplication/json',
          },
        ),
        data: {
          "sid": "$sid",
          "email": "$email",
          "password": "$password",
          "type": "0"
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('done done');
    } else {
      print('no no n on o  on ');
    }
    // List<dynamic> products = response.data;
    return response.statusCode;
  }

  Future loginApi(
      String email, String password, BuildContext context, int type) async {
    String url = 'https://elhaj.000webhostapp.com/api/login';
    Response response = await dio.post(url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {"email": "$email", "password": "$password", "type": "$type"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (type == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainHome()));
        print('done done MainHome');
      } else if (type == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainHomeCompany()));
        print('done done MainHomeCompany');
      } else if (type == 2) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainHomeMinistry()));
        print('done done MainHomeMinistry');
      }
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
      print('no no n on o  on ');
    }
    //  dynamic sid = response.data["Sid is"];
    return response.data;
  }

  Future<dynamic> singleUserInfo(var sid) async {
    //print('ooooooooooooooooooooooooooo');

    String url = "https://elhaj.000webhostapp.com/api/getUserInfo?id=$sid";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    //print('ooooooooooooooooooooooooooo');

    dynamic hajInfo = response.data["0"];
    print(response.data["0"]);

    //print('ooooooooooooooooooooooooooo');
    //print(response.statusCode);

    //if (response.statusCode == 200) {
    // print(response.data["0"]);
    // print("422 422 422");
    // } else {
    //   print('nnnnnnnnnnnnnnn');
    // }
    return hajInfo;
  }

  Future<dynamic> singleHajAllInfo(var sid) async {
    //print('ooooooooooooooooooooooooooo');

    String url = "https://elhaj.000webhostapp.com/api/getAppBySid?id=$sid";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    //print('ooooooooooooooooooooooooooo');

    dynamic hajInfo = response.data["haj account data"];

    return hajInfo;
  }

  Future<dynamic> AllCompany() async {
    String url = "https://elhaj.000webhostapp.com/api/getAllCompanyNames";
    Response response = await dio.get(url);
    List<dynamic> companys = response.data["0"];
    return companys;
  }

  Future hajAppFill(int sid, int company_id, String company_name,
      String address, String mobile_number, BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/createApp';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "company_id": "$company_id",
          "main_haj_sid": "$sid",
          "address": "$address",
          "Company_name": "$company_name",
          "mabile_number": "$mobile_number"
        });
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Provider.of<AuthProvider>(context, listen: false).result =
          response.data['message'];
      print('done done');

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddFollower()));
    } else {
      print('no no n on o  on ');
    }
    // List<dynamic> products = response.data;
    return response.data['message'];
  }

  Future<dynamic> singleCompanyInfo(var id) async {
    String url = "https://elhaj.000webhostapp.com/api/getCompanyInfo?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic companyInfoById = response.data["company data"];

    return companyInfoById;
  }

  // Future<dynamic> singleCompanyContactInfo(var id) async {
  //   String url = "https://elhaj.000webhostapp.com/api/getCompanyInfo?id=$id";
  //   Response response = await dio.get(url,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //       }));
  //   dynamic companyInfoById = response.data["Company Contact Info"];

  //   return companyInfoById;
  // }

  Future<dynamic> hajVacc(var id) async {
    String url = "https://elhaj.000webhostapp.com/api/indexVaccination?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic hajVacc = response.data["0"];
    print(response.data);

    return hajVacc;
  }

//compination
  // Future<dynamic> singleCompinationInfo(var sid) async {
  //   String url = "https://elhaj.000webhostapp.com/api/getUserInfo?id=$sid";
  //   Response response = await dio.get(url,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //       }));
  //   dynamic companion = response.data;

  //   return companion;
  // }

  ///add compination

  Future addcompination(int? sid, String? address, String? mobile,
      int? main_haj_sid, BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/addCompanion';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "sid": "$sid",
          "address": "$address",
          "mobile": "$mobile",
          "main_haj_sid": "$main_haj_sid",
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('done done');

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddFollower()));
    } else {
      print('no no n on o  on ');
    }
    // List<dynamic> products = response.data;
    return response.data['message'];
  }

  ///get all compinatin by haj
  Future<List<dynamic>> getAllCompinatinForHaj(int? id) async {
    String url =
        "https://elhaj.000webhostapp.com/api/getALLCompanionWithHaj?id=$id";
    Response response = await dio.get(url);
    List<dynamic> allCompinatin = response.data["0"];
    return allCompinatin;
  }

  //add passport details

  Future addPassportDetails(
      String? passport_expiry,
      String? passport_image,
      String? name1,
      String? name2,
      String? name3,
      String? name4,
      String? passport_number,
      String? haj_image,
      String? main_haj_sid,
      BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/createPassportInfo';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "main_haj_sid": "$main_haj_sid",
          "name1": "$name1",
          "name2": "$name2",
          "name3": "$name3",
          "name4": "$name4",
          "passport_expiry": "$passport_expiry",
          "passport_image": "$passport_image ",
          "passport_number": "$passport_number",
          "haj_image": "$haj_image"
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('done done');

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainHome()));
    } else {
      print('no no n on o  on ');
    }
    // List<dynamic> products = response.data;
    return response.statusCode;
  }

//تفويج والتسكين
  Future<dynamic> getTafwijInfo(var id) async {
    String url =
        "https://elhaj.000webhostapp.com/api/getTafwijInfo?id=406070664";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic tafwaij = response.data["0"];
    print(response.data);

    return tafwaij;
  }

  //store sos info
  Future storeSosInfo(String? sid, String? address, String? latitude,
      String? longitude, String? company_id, BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/createSos';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "sid": "$sid",
          "address": "$address",
          "isFinish": "0",
          "latitude": "$latitude",
          "longitude": "$longitude",
          "company_id": "$company_id",
        });
    if (response.statusCode == 200) {
      print('done done');

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => MainHome()));
    } else {
      print('no no n on o  on ');
    }
    print(response.data);

    return response.data['sos Info'];
  }

//get app info
  Future<dynamic> getAllAppInfo(var id) async {
    String url = "https://elhaj.000webhostapp.com/api/getAppBySid?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic allAppData = response.data;
    print(response.data);

    return allAppData;
  }

  /////////////Company api//////////////////
  //store company Info
  Future storeCompanyInfo(
      String? mobile,
      String? tel,
      String? about_us,
      String? Company_name,
      String? logo,
      String? address,
      int? user_id,
      BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/createCompany';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "mobile": "$mobile",
          "address": "$address",
          "tel": "$tel",
          "about_us": "$about_us",
          "Company_name": "$Company_name",
          "logo": "$logo",
          "user_id": "$user_id",
        });
    if (response.statusCode == 200) {
      print('done done');

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainHomeCompany()));
    } else {
      print('no no n on o  on ');
    }
    print(response.data);

    return response.data;
  }

  Future updateCompanyInfo(
      String? mobile,
      String? tel,
      String? about_us,
      String? Company_name,
      String? logo,
      String? address,
      int? id,
      BuildContext context) async {
    String url = 'https://elhaj.000webhostapp.com/api/update/$id';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "mobile": "$mobile",
          "address": "$address",
          "tel": "$tel",
          "about_us": "$about_us",
          "Company_name": "$Company_name",
          "logo": "$logo",
        });
    if (response.statusCode == 200) {
      print('done done');

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => MainHomeCompany()));
    } else {
      print('no no n on o  on ');
    }
    print(response.data);

    return response.data;
  }

//get all sos info by company id
  Future<dynamic> allSosByCompanyId(var id) async {
    String url =
        "https://elhaj.000webhostapp.com/api/getAllSOSByCompanyId?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic allSosByCompanyId = response.data['company data'];
    print(response.data);
    print(allSosByCompanyId);

    return allSosByCompanyId;
  }

  //count sos
  countSosForCompany(var id) async {
    String url = "https://elhaj.000webhostapp.com/api/countOfSos?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic countSos = response.data['0'];
    print(response.data);

    return countSos;
  }

  //count app for company
  countAppForCompany(var id) async {
    String url = "https://elhaj.000webhostapp.com/api/countOfHajApp?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic countApp = response.data['0'];
    print(response.data);

    return countApp;
  }

  //get all hajApp for limit company
  Future<dynamic> allAppForCompany(var id) async {
    String url =
        "https://elhaj.000webhostapp.com/api/getAllHajAppByCompanyId?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic allApp = response.data['Haj app data'];
    // print(response.data);

    return allApp;
  }

  //get company Info by user Id
  Future<dynamic> getCompanyInfoByUserId(var id) async {
    String url =
        "https://elhaj.000webhostapp.com/api/getCompanyInfoByUserId?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic companyInfoByUserId = response.data["company data"];

    return companyInfoByUserId;
  }

  ////////////////////////////////////Ministry api //////////////////////////
  //get all hajAccept
//List<UserInformation> allAcceptHajs;
  Future<dynamic> allAcceptHajs() async {
    String url = "https://elhaj.000webhostapp.com/api/getAllAcceptedPilgrims";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic allAccept = response.data["0"];
    print(allAccept);

    return allAccept;
  }

  //get all sos info
  Future<dynamic> allSos() async {
    String url = "https://elhaj.000webhostapp.com/api/getAllSos";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    dynamic allSos = response.data['0'];
    print(response.data);
    print(allSos);

    return allSos;
  }

  //delete sos
  Future<dynamic> deleteSos(int id) async {
    String url = "https://elhaj.000webhostapp.com/api/removeSos?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    // dynamic allSos = response.data['0'];
    // print(response.data);
    // print(allSos);

    //return allSos;
  }

  getAllHajAndCompinationInfo(int id) async {
    //https://elhaj.000webhostapp.com/api/getAppBySid?id=4054321
    String url = "https://elhaj.000webhostapp.com/api/getAppBySid?id=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    // allHajInformation = response.data['haj account data'];
    // allComForHaj = response.data['companion data'];
    return response.data;
  }

//delete Compination
  deleteCompintion(int? id) async {
    //https://elhaj.000webhostapp.com/api/removeCompanion?sid=123456789
    String url = "https://elhaj.000webhostapp.com/api/removeCompanion?sid=$id";
    Response response = await dio.get(url,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
  }

  //evaluation company
  postRatingCompany(
      int? company_id, int? haj_id, String? rating_note, int? rating) async {
    String url = 'https://elhaj.000webhostapp.com/api/createRating';
    Response response = await dio.post(url,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: {
          "company_id": "$company_id",
          "haj_id": "$haj_id",
          "rating_note": "$rating_note",
          "rating": "$rating",
        });
    if (response.statusCode == 200) {
      print('done done');

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => MainHomeCompany()));
    } else {
      print('no no n on o  on ');
    }
    print(response.data);
  }
}
