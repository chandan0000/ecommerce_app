import 'package:ecommerce/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/auth/login_screens.dart';

class Routes {
  static CupertinoPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => LoginProvider(context),
                child: const LoginScreen()));

      case SignUp.routeName:
        return CupertinoPageRoute(builder: (context) => const SignUp());

      default:
        return null;
    }
  }
}
