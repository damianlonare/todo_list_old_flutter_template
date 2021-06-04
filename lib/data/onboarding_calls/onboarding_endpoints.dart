import 'dart:async';

import 'package:clean_onboarding/utils/network_util.dart';
import 'package:clean_onboarding/models/user.dart';
import 'package:clean_onboarding/models/user_logged.dart';

class OnBoardingRestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final prodBaseUrl = "https://";
  static final qaBaseUrl = "https://.com";
  static final localBaseUrl = "http://:9999/";
  static final loginUrl = prodBaseUrl + "/auth/login";
  static final signUpUrl = prodBaseUrl + "/auth/signup";
  // static final _API_KEY = "";

  /* Future<LoginCall> login_call(String email, String password) {
    // "token": _API_KEY,
    return _netUtil.post(LOGIN_URL, body: {
      "email": email,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  } */

  Future<User> login(String email, String password) {
    // "token": _API_KEY,
    return _netUtil.post(loginUrl, body: {
      "email": email,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }

  /* Future<UserCall> signup_call(String name, String surname, String email, String password, String phone) {
    // "token": _API_KEY,
    return _netUtil.post(SIGNUP_URL, body: {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "phone": phone
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  } */

  Future<UserLogged> signup(String name, String surname, String email, String password, String phone) {
    return _netUtil.post(signUpUrl, body: {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "phone": phone
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new UserLogged.map(res["user_token"]);
    });
  }
}
