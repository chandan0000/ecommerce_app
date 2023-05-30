import 'package:ecommerce/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screens.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui.dart';
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
    return Scaffold(
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
                controller: provider.emailController,
                labelText: "Email Address",
              ),
              const GapWidget(),
              PrimaryTextField(
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
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    text: "Sign Up",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
