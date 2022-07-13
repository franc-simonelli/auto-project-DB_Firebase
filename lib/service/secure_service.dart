
// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:autoproject/models/logged_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  FlutterSecureStorage? _storage;
  final String _userLoggedKey = "LOGGED_USER";
  final String _userDataKey = "USER_DATA";
  LoggedUser? _loggedUser;
  // UserModel? _userData;


  SecureService() {
    _storage = new FlutterSecureStorage();
  }

  Future<bool> isLogged() async {
    var loggedUser = await getLoggedUser();
    return loggedUser != null;
    //return true;
  }

  // Future<bool> isUser() async {
  //   var userExist = await getUserData();
  //   return userExist != null;
  // }

  Future setLoggedUser(LoggedUser? value) async {
    if (value != null) {
      var serUser = jsonEncode(value.toJson());
      _storage!.write(key: _userLoggedKey, value: serUser);
    } else {
      _storage!.delete(key: _userLoggedKey);
    }
    _loggedUser = value;
  }

  Future<LoggedUser?> getLoggedUser() async {
    var value = await _storage!.read(key: _userLoggedKey);
    if (value == null || value.isEmpty) {
      _loggedUser = null;
    } else {
      _loggedUser = LoggedUser.fromJson(json.decode(value));
    }
    return _loggedUser;
  }

  // Future<UserModel?> getUserData() async {
  //   var value = await _storage!.read(key: _userDataKey);
  //   if (value == null || value.isEmpty) {
  //     _userData = null;
  //   } else {
  //     _userData = UserModel.fromJson(json.decode(value));
  //   }
  //   return _userData;
  // }

  // Future setUserData(UserData? value) async {
  //   if (value != null) {
  //     var serUser = jsonEncode(value.toJson());
  //     await _storage!.write(key: _userDataKey, value: serUser);
  //   } else {
  //     await _storage!.delete(key: _userDataKey);
  //   }
  //   _userData = value as UserModel?;
  // }

}