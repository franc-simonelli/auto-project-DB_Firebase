// ignore: unused_import
// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'package:autoproject/provider/auto_provider.dart';
import 'package:autoproject/provider/google_provider.dart';
import 'package:autoproject/screen/aggiungiCostruttore/aggiungi_costruttore_screen.dart';
import 'package:autoproject/screen/home/homePage_screen.dart';
import 'package:autoproject/screen/login/login_screen.dart';
import 'package:autoproject/screen/splashScreen/splash_screen.dart';
import 'package:autoproject/service/login_google_service.dart';
import 'package:autoproject/service/secure_service.dart';
import 'package:autoproject/utils/my_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

late bool isLogged = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ModuleContainer().initialise(Injector());
  SecureService _secureService = Injector().get<SecureService>();
  isLogged = await _secureService.isLogged();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AutoProvider()),
        ChangeNotifierProvider(create: (_) => GoogleProvider())
      ],
      child: MyApp(),
    )
  );


  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: createRoutes(),
      theme: AppTheme.theme,
      home: isLogged? HomePageScreen() : LoginScreen(),
      // home: AggiungiCostruttoreScreen(),
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<LoginGoogleService>((i) => LoginGoogleService(), isSingleton: false);
    injector.map<SecureService>((i) => SecureService(), isSingleton: false);
    
    return injector;
  }
}

Map<String, Widget Function(BuildContext)> createRoutes() {
  return {
    SplashScreen.routeName: (ctx) => SplashScreen(),
    LoginScreen.routeName: (ctx) => LoginScreen(),
    HomePageScreen.routeName: (ctx) => HomePageScreen(),
    AggiungiCostruttoreScreen.routeName: (ctx) => AggiungiCostruttoreScreen(),
  };
}

