import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geocoding/geocoding.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grad_app/helper/api_helper_details.dart';
import 'package:grad_app/helper/firestore_helper.dart';
import 'package:grad_app/model/compination.dart';
import 'package:grad_app/model/haj_app_data.dart';
import 'package:grad_app/model/sos.dart';
import 'package:grad_app/model/tafwaijInfo.dart';
import 'package:grad_app/model/user_info.dart';
import 'package:grad_app/view_screen/login_screen.dart';
import 'package:grad_app/view_screen/main_home.dart';

import '../helper/auth_helper.dart';
import '../model/Vaccination.dart';
import '../model/accept_haj_model.dart';
import '../model/company.dart';
import '../model/register_model.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sidController = TextEditingController();
  TextEditingController sidCompinationController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController comAddressController = TextEditingController();
  TextEditingController comMobileNumberController = TextEditingController();
  bool istrueRegister = false;
  int? mainHajId;
  int counter = 0;
  int loginType = 0;
  String? result;
  bool completeApp = false;
  increasCount() {
    counter = counter + 1;
    notifyListeners();
  }

  restCount() {
    counter = 0;
    notifyListeners();
  }

  int getCount() {
    return counter;
    notifyListeners();
  }

  resetControllers() {
    emailController.clear();
    passwordController.clear();
    sidController.clear();
  }

  register(BuildContext context) async {
    try {
      var userCredential = await AuthHelper.authHelper
          .signup(emailController.text.trim(), passwordController.text.trim());

      // print("frommmm auth provider${userCredential.user.uid}");

      String id = await userCredential.user!.uid;
      print('idididididdi$id');

      RegisterRequest registerRequest = RegisterRequest(
        sid: sidController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      var h =
          await FirestoreHelper.firestoreHelper.addToFirestore(registerRequest);
      print('hhhhhhhhhhhhhhhhhhhhhh$h');
      resetControllers();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } on Exception catch (e) {
      istrueRegister = false;
      print('$e');
    }
  }

  login(BuildContext context) async {
    try {
      var userCredential = await AuthHelper.authHelper
          .signin(emailController.text.trim(), passwordController.text.trim());

      // print("frommmm auth provider${userCredential.user.uid}");

      print('idididididdi$userCredential');

      RegisterRequest registerRequest = RegisterRequest(
        sid: sidController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      // var h =
      //     await FirestoreHelper.firestoreHelper.addToFirestore(registerRequest);
      // print('hhhhhhhhhhhhhhhhhhhhhh$h');
      resetControllers();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainHome()));
    } on Exception catch (e) {
      print('$e');
    }
  }

  resetPassword() async {
    AuthHelper.authHelper.resetPassword(emailController.text.trim());
    resetControllers();
  }

  ////////////////////////////api

  postRegister() async {
    await ApiHelper.apiHelper.registerApi(sidController.text.trim(),
        emailController.text.trim(), passwordController.text.trim());
    notifyListeners();
  }

  int? user_id;
  postLogin(BuildContext context) async {
    dynamic data = await ApiHelper.apiHelper.loginApi(
        emailController.text.trim(),
        passwordController.text.trim(),
        context,
        loginType);

    mainHajId = data['Sid is'];
    user_id = data['User_id'];
    print("${mainHajId}");
    print(user_id);
    // getSingleCompanyByUserId();
    notifyListeners();
  }

  UserInformation? hajInfo;
  getSingleHajInfo(var sid) async {
    dynamic singleHajInfo = await ApiHelper.apiHelper.singleUserInfo(sid);

    hajInfo = UserInformation.fromJson(singleHajInfo[0]);
    //print(singleHajInfo);
    print('user info user info user info');
    print(hajInfo!.toJson());
    // if (hajInfo!.social_status == 1) {
    //   step1 = true;
    //   step2 = true;
    //   step3 = true;
    //   step4 = true;
    //   step5 = true;
    // }
    return hajInfo;
    notifyListeners();
  }

//singleHajAllInfo
  AcceptHajModels? allHajInfo;
  getAllHajInfo(var sid) async {
    dynamic singleHajInfo = await ApiHelper.apiHelper.singleHajAllInfo(sid);

    allHajInfo = AcceptHajModels.fromJson(singleHajInfo[0]);
    //print(singleHajInfo);
    print('user info user info user info');
    print(allHajInfo!.toJson());
    if (allHajInfo!.status == 1) {
      step1 = true;
      step2 = true;
      step3 = true;
      step4 = true;
      step5 = true;
    }
    notifyListeners();
  }

  List<Company>? listAllCompany;
  Company? com;
  getAllCompany() async {
    List<dynamic> allCompany = await ApiHelper.apiHelper.AllCompany();
    listAllCompany = allCompany.map((e) => Company.fromJson(e)).toList();
    print(listAllCompany);
    notifyListeners();
  }

  postHajAppFill(int sid, int company_id, String company_name,
      BuildContext context) async {
    addressController.text = addressController.text.trim().isEmpty
        ? "0"
        : addressController.text.trim();
    mobileNumberController.text = mobileNumberController.text.trim().isEmpty
        ? "0"
        : mobileNumberController.text.trim();

    print(addressController.text.trim());
    print(mobileNumberController.text.trim());
    result = await ApiHelper.apiHelper.hajAppFill(
        sid,
        company_id,
        company_name,
        addressController.text.trim(),
        mobileNumberController.text.trim(),
        context);
    print(result);
    notifyListeners();
  }

  Company? companyInfoById;
  getSingleCompany(var id) async {
    dynamic singleComInfo = await ApiHelper.apiHelper.singleCompanyInfo(id);

    companyInfoById = Company.fromJson(singleComInfo[0]);

    print(companyInfoById!.toJson());
    notifyListeners();
  }

  Vaccination? hajVaccTime;
  getHajVacc(var id) async {
    dynamic hajVac = await ApiHelper.apiHelper.hajVacc(id);

    hajVaccTime = Vaccination.fromJson(hajVac[0]);
    //print(singleHajInfo);
    print(hajVaccTime!.toJson());
    notifyListeners();
  }

  //compination
  UserInformation? compinationInfo;
  getSinglecominationInfo() async {
    dynamic singleHajInfo = await ApiHelper.apiHelper
        .singleUserInfo(sidCompinationController.text.trim());

    compinationInfo = UserInformation.fromJson(singleHajInfo[0]);
    //print(singleHajInfo);
    print(compinationInfo!.toJson());
    notifyListeners();
  }

  //  getSingleHajInfo(var sid) async {
  //   dynamic singleHajInfo = await ApiHelper.apiHelper.singleUserInfo(sid);

  //   hajInfo = UserInformation.fromJson(singleHajInfo[0]);
  //   //print(singleHajInfo);
  //   print('user info user info user info');
  //   print(hajInfo!.toJson());
  //   notifyListeners();
  // }

  //add compination //addcompination
  postCompination(BuildContext context) async {
    comAddressController.text = comAddressController.text.trim().isEmpty
        ? "0"
        : comAddressController.text.trim();
    comMobileNumberController.text =
        comMobileNumberController.text.trim().isEmpty
            ? "0"
            : comMobileNumberController.text.trim();

    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    print("${compinationInfo!.sid}");
    String g = await ApiHelper.apiHelper.addcompination(
        int.parse(sidCompinationController.text.trim()),
        comAddressController.text.trim(),
        comMobileNumberController.text.trim(),
        mainHajId,
        context);
    print(g);
    notifyListeners();
  }

  List<Companion>? allCompination;
  //get Compinaton for haj
  getAllCompinationForHaj() async {
    List<dynamic> comp =
        await ApiHelper.apiHelper.getAllCompinatinForHaj(mainHajId);
    allCompination = comp.map((e) => Companion.fromJson(e)).toList();
    print(
        'allCompinationallCompinationallCompinationallCompinationallCompination');
    print(allCompination![0]);
    notifyListeners();
  }

  //step color
  bool step1 = true;
  bool step2 = false;
  bool step3 = false;
  bool step4 = false;
  bool step5 = false;
  TextEditingController passExpiryController = TextEditingController();
  TextEditingController passname1Controller = TextEditingController();
  TextEditingController passname2Controller = TextEditingController();
  TextEditingController passname3Controller = TextEditingController();
  TextEditingController passname4Controller = TextEditingController();
  TextEditingController passNumberController = TextEditingController();

  //post passport details
  postPassportDetails(BuildContext context) async {
    print(passExpiryController.text.trim());
    print(passname1Controller.text.trim());
    print(passname2Controller.text.trim());
    print(passname3Controller.text.trim());
    print(passname4Controller.text.trim());
    print(
      passNumberController.text.trim(),
    );

    await ApiHelper.apiHelper.addPassportDetails(
        passExpiryController.text.trim(),
        " image",
        passname1Controller.text.trim(),
        passname2Controller.text.trim(),
        passname3Controller.text.trim(),
        passname4Controller.text.trim(),
        passNumberController.text.trim(),
        "image ",
        "${mainHajId}",
        context);
    // await ApiHelper.apiHelper.addPassportDetails(
    //     "04/23",
    //     "http://cdn.cnn.com/cnnnext/dam/assets/210316052514-iceland-gender-neutral-passport.jpg",
    //     "shaima",
    //     "R",
    //     "F",
    //     "zakout",
    //     "14782",
    //     "https://visafoto.com/img/docs/nz_passport.jpg ",
    //     context);
    notifyListeners();
  }

  //تفويج
  TafwaijInfo? tafwaijInfo;
  List<TafwaijInfo>? getAllTafwaijInfo;
  //get Compinaton for haj
  getTafwaijInfo() async {
    List<dynamic> tafInfo = await ApiHelper.apiHelper.getTafwijInfo(mainHajId);
    getAllTafwaijInfo = tafInfo.map((e) => TafwaijInfo.fromJson(e)).toList();
    print(
        'getAllTafwaijInfogetAllTafwaijInfogetAllTafwaijInfogetAllTafwaijInfogetAllTafwaijInfo');
    print(getAllTafwaijInfo![0].toJson());
    print(getAllTafwaijInfo);
    return getAllTafwaijInfo;
    notifyListeners();
  }

  // gelocator
  Position? current_position;

  getLatAndLang() async {
    current_position =
        await Geolocator.getCurrentPosition().then((value) => value);
    notifyListeners();
  }

  getPosition(BuildContext context) async {
    bool services;
    LocationPermission per = await Geolocator.checkPermission();

    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      // ignore: avoid_single_cascade_in_expression_statements
      AwesomeDialog(
          context: context,
          title: "services",
          body: const Text('services Not Enabeled'))
        ..show();
    }
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      // notifyListeners();
    }
    if (per == LocationPermission.whileInUse ||
        per == LocationPermission.always) {
      await getLatAndLang();
      print('current_positioncurrent_positioncurrent_positioncurrent_position');
      print(current_position);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          current_position!.latitude, current_position!.longitude);
      print(placemarks[0].country);
      notifyListeners();
    }

    //getLocationInfo(current_position!.altitude, current_position!.longitude);

    print(per);
    notifyListeners();
  }

  List<String>? allstreet = [];
  getSosPostion(List<SosInfo>? sos) async {
    print('getAllSosInfogetAllSosInfo$getAllSosInfo');
    sos!.map((e) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.parse(e.latitude!), double.parse(e.longitude!));
      allstreet!.add(placemarks[0].street!);
      notifyListeners();
      //  return placemarks[0].street;
    }).toList();
    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(latitude, longitude);
    // print(placemarks[0].street);
    // street = placemarks[0].street;
    // notifyListeners();
    // return placemarks[0].street!;
  }

  // getLocationInfo(double latitude, double longitude) async {
  //   List<Placemark> placeMarks =
  //       await placemarkFromCoordinates(latitude, longitude);
  //   print(placeMarks[0].country);

  //   print(placeMarks[0].street);
  // }

  //post sos info
  int status = 0;
  int? companyHajId;
  SosInfo? ss;
  postSosInfo(BuildContext context) async {
    ss = await ApiHelper.apiHelper.storeSosInfo(
        mainHajId.toString(),
        "address",
        current_position!.latitude.toString(),
        current_position!.longitude.toString(),
        "$companyHajId",
        context);

    notifyListeners();
  }

  //getAllAppData
  getAllAppData() async {
    dynamic allAppInfo = await ApiHelper.apiHelper.getAllAppInfo(mainHajId);
    status = allAppInfo['haj account data'][0]['status'];
    companyHajId = allAppInfo['app data'][0]['company_id'];
    print(status);
    print(companyHajId);
    notifyListeners();
  }

  //////////company api /////////
  TextEditingController companyMobileController = TextEditingController();
  TextEditingController CompanyTelController = TextEditingController();
  TextEditingController CompanyAboutUsController = TextEditingController();
  TextEditingController CompanyNameController = TextEditingController();
  TextEditingController CompanyAddressController = TextEditingController();

  postCompanyInfo(BuildContext context) async {
    print(companyMobileController.text.trim());
    print(CompanyTelController.text.trim());
    print(CompanyAboutUsController.text.trim());
    print(CompanyNameController.text.trim());
    print(CompanyAddressController.text.trim());

    await ApiHelper.apiHelper.storeCompanyInfo(
        companyMobileController.text.trim(),
        CompanyTelController.text.trim(),
        CompanyAboutUsController.text.trim(),
        CompanyNameController.text.trim(),
        'logo',
        CompanyAddressController.text.trim(),
        user_id,
        context);
    notifyListeners();
  }

  updateCompanyInfo(BuildContext context, int? id) async {
    print(companyMobileController.text.trim());
    print(CompanyTelController.text.trim());
    print(CompanyAboutUsController.text.trim());
    print(CompanyNameController.text.trim());
    print(CompanyAddressController.text.trim());

    await ApiHelper.apiHelper.updateCompanyInfo(
        companyMobileController.text.trim(),
        CompanyTelController.text.trim(),
        CompanyAboutUsController.text.trim(),
        CompanyNameController.text.trim(),
        'logo',
        CompanyAddressController.text.trim(),
        id,
        context);
    notifyListeners();
  }

  //get all sos info by company id
  List<SosInfo>? getAllSosInfo = [];
  //get Compinaton for haj
  getallSosByCompanyId() async {
    var sosInfo = await ApiHelper.apiHelper
        .allSosByCompanyId(companyInfoByUserId!.company_id);
    if (sosInfo != null) {
      getAllSosInfo = sosInfo.map((e) => SosInfo.fromJson(e)).toList();
    } else {}

    // print(getAllSosInfo![0].toJson());
    // print(getAllSosInfo);
    // return getAllSosInfo;
    notifyListeners();
  }

  //get count sos
  int? countSos;
  getCountSos() async {
    countSos = await ApiHelper.apiHelper
        .countSosForCompany(companyInfoByUserId!.company_id);
    //companyInfoByUserId!.company_id
    print(countSos);
    // return countSos;
    notifyListeners();
  }

  //get count app
  int? countApp;
  getCountApp() async {
    countApp = await ApiHelper.apiHelper
        .countAppForCompany(companyInfoByUserId!.company_id);
    print(countApp);
    // return countApp;
    notifyListeners();
  }

  //get company info by user id
  Company? companyInfoByUserId;
  int? companyId;
  getSingleCompanyByUserId() async {
    dynamic singleComInfo =
        await ApiHelper.apiHelper.getCompanyInfoByUserId(user_id);

    companyInfoByUserId = Company.fromJson(singleComInfo[0]);
    companyId = companyInfoByUserId!.company_id;
    print('companyIdcompanyIdcompanyIdcompanyIdcompanyId$companyId');
    print('from getSingleCompanyByUserId');
    print(companyInfoByUserId!.toJson());
    notifyListeners();
  }

  //get all app for limit company
  List<HajAppData>? getAllAppInfo;

  getallAppByCompanyId(int id) async {
    // print('companyId$companyId');
    //List<dynamic> allAppInfo = await ApiHelper.apiHelper.allAppForCompany(1);
    var allAppInfo = await ApiHelper.apiHelper.allAppForCompany(id);
    if (allAppInfo != null) {
      getAllAppInfo = allAppInfo.map((e) => HajAppData.fromJson(e)).toList();
    } else {}

    print(getAllAppInfo![0].toJson());
    print('allallalalalalallalallalalalal');
    print(getAllAppInfo);
    //return getAllAppInfo;
    notifyListeners();
  }

  /////////////////////////////Ministry api //////////////////////////////
  ///getAllAcceptHajs
  List<AcceptHajModels>? allAcceptHajs;
  getAllAcceptHajs() async {
    List<dynamic> allAccept = await ApiHelper.apiHelper.allAcceptHajs();
    allAcceptHajs = allAccept.map((e) => AcceptHajModels.fromJson(e)).toList();
    print(allAcceptHajs![0].toJson());
    print('allallalalalalallalallalalalal');
    print(allAcceptHajs);
    //return allAcceptHajs;
    notifyListeners();
  }

  //get all sos

  List<SosInfo>? allSosForMinistry;
  //get Compinaton for haj
  getallSos() async {
    var allsosInfo = await ApiHelper.apiHelper.allSos();
    if (allsosInfo != null) {
      allSosForMinistry = allsosInfo.map((e) => SosInfo.fromJson(e)).toList();
    } else {}

    print(allSosForMinistry![0].toJson());
    print(allSosForMinistry);
    //return allSosForMinistry;
    notifyListeners();
  }

  //deleteSos
  deleteSos(int id) async {
    await ApiHelper.apiHelper.deleteSos(id);
    await getallSos();
    await getallSosByCompanyId();
    notifyListeners();
  }

  //delete compination deleteCompintion
  deleteCom(int? id) async {
    await ApiHelper.apiHelper.deleteCompintion(id);

    notifyListeners();
  }

//getAllHajAndCompinationInfo
  UserInformation? allHajInformation;
  List<Companion>? allComForHaj;
  getAllHajAndCompinationInfo(int id) async {
    var allData = await ApiHelper.apiHelper.getAllHajAndCompinationInfo(id);
    allHajInformation =
        UserInformation.fromJson(allData['haj account data'][0]);
    List<dynamic> allcom = allData['companion data'];
    allComForHaj = allcom.map((e) => Companion.fromJson(e)).toList();
    notifyListeners();
  }

  List<UserInformation>? listAllHajAcccountForApp = [];
  getlistAllHajAcccountForApp(List<HajAppData>? AppInfo) async {
    AppInfo!.map((e) async {
      var allData = await ApiHelper.apiHelper
          .getAllHajAndCompinationInfo(e.main_haj_sid!);
      allHajInformation =
          UserInformation.fromJson(allData['haj account data'][0]);
      listAllHajAcccountForApp!.add(allHajInformation!);
      notifyListeners();
    }).toList();
    print('listAllHajAcccountForApp$listAllHajAcccountForApp');
    notifyListeners();
    // var allData =
  }

  List<UserInformation>? listAllHajAcccountForMinistry = [];
  getlistAllHajAcccountForMinistry(List<AcceptHajModels>? AppInfo) async {
    AppInfo!.map((e) async {
      var allData = await ApiHelper.apiHelper
          .getAllHajAndCompinationInfo(e.main_haj_sid!);
      allHajInformation =
          UserInformation.fromJson(allData['haj account data'][0]);
      listAllHajAcccountForMinistry!.add(allHajInformation!);
      notifyListeners();
    }).toList();
    print('listAllHajAcccountForApp$listAllHajAcccountForMinistry');
    notifyListeners();
    // var allData =
  }

  TextEditingController ratingNote = TextEditingController();
  //rating company
  ratingCompany(int? company_id, int? haj_id, int? rating) async {
    await ApiHelper.apiHelper
        .postRatingCompany(company_id, haj_id, ratingNote.text, rating);
    notifyListeners();
  }
}
