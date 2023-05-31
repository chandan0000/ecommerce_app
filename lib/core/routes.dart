import 'package:ecommerce/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screens.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/auth/login_screens.dart';
import '../presentation/screens/auth/provider/signup_provider.dart';
import '../presentation/screens/splash/splash_screen.dart';

class Routes {
  static CupertinoPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => LoginProvider(context),
                child: const LoginScreen()));

      case SignUpScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => SignupProvider(context),
                  child: const SignUpScreen(),
                ));
      case HomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      default:
        return null;
    }
  }
}
