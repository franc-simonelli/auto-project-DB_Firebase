// ignore_for_file: unused_field

import 'package:autoproject/models/logged_user.dart';
import 'package:autoproject/service/login_google_service.dart';
import 'package:autoproject/service/secure_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String accessToken = '';
  String idToken = '';
  bool _loadingGoogle = false;
  String _user = '';

  bool get loadingGoogle => _loadingGoogle;
  String get user => _user;

  Future signInwithGoogle() async {
    _loadingGoogle = true;
    notifyListeners();
    LoginGoogleService _loginGoogleService = Injector().get<LoginGoogleService>();
    final _result = await _loginGoogleService.signInwithGoogle();
    
    SecureService _secureService = Injector().get<SecureService>();
    LoggedUser _user = new LoggedUser();
    _user.displayName = _result.user.displayName;
    _user.email = _result.user.email;
    _user.emailVerified = _result.user.emailVerified;
    _user.photoURL = _result.user.photoURL;
    await _secureService.setLoggedUser(_user);
    
    _loadingGoogle = false;
    notifyListeners();
  }

  Future getUser() async {
    SecureService _secureService = Injector().get<SecureService>();
    final user =await _secureService.getLoggedUser();
    _user = getFirstWord(user!.displayName!) ;
    notifyListeners();
  }

  getFirstWord(String inputString) {
    List<String> wordList = inputString.split(" ");
    if (wordList.isNotEmpty) {
      return wordList[0];
    } else {
      return ' ';
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
    SecureService _secureService = Injector().get<SecureService>();
    _secureService.setLoggedUser(null);
  }
  
}