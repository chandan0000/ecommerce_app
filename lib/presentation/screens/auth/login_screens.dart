import 'package:ecommerce/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screens.dart';
import 'package:ecommerce/presentation/screens/splash/splash_screen.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/ui.dart';
import '../../../logic/cubits/user_cubits/user_cubit.dart';
import '../../../logic/cubits/user_cubits/user_state.dart';
import '../../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "signin";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(
      context,
    );
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          // Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Ecommerce App"),
        ),
        body: Form(
          key: provider.formKey,
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text("Login In", style: TextStyles.heading2),
                const GapWidget(size: -10),
                (provider.error != "")
                    ? Text(
                        provider.error,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const GapWidget(size: 5),
                PrimaryTextField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email address is required!";
                    }

                    if (!EmailValidator.validate(value.trim())) {
                      return "Invalid email address";
                    }

                    return null;
                  },
                  controller: provider.emailController,
                  labelText: "Email Address",
                ),
                const GapWidget(),
                PrimaryTextField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required!";
                    }
                    return null;
                  },
                  controller: provider.passwordController,
                  labelText: "password",
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinkButton(
                      text: "Forgot Password",
                      onPressed: () {},
                    ),
                  ],
                ),
                const GapWidget(),
                PrimaryButton(
                  text: (provider.isLoading) ? "..." : "Login",
                  onPressed: provider.logIn,
                ),
                const GapWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: TextStyles.body2),
                    const GapWidget(),
                    LinkButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      text: "Sign Up",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
