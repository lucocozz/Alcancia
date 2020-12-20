import 'package:alcancia/constants.dart';
import 'package:alcancia/pages/auth/auth_page.dart';
import 'package:alcancia/services/authentication_service.dart';
import 'package:alcancia/pages/account/widgets/account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_page.dart';
import './themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alcancia',
        theme: ThemeData(
          accentColor: gAccentColor,
          primaryColor: gPrimaryColor,
          backgroundColor: gBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: gFontFamily),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: AnimatedSplashScreen(
          duration: 1000,
          splash: SplashScreen(),
          splashIconSize: 200,
          backgroundColor: gBackgroundColor,
          nextScreen: AuthenticationWrapper(),
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          AccountPage.routeName: (context) => AccountPage(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) return HomePage();
    return AuthPage();
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            gAlcanciaLogo,
            color: Colors.white,
            height: 100,
          ),
          SizedBox(height: 10),
          Text(
            "alcancia",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              letterSpacing: 3,
              fontFamily: "FredokaOne",
            ),
          ),
        ],
      ),
    );
  }
}
