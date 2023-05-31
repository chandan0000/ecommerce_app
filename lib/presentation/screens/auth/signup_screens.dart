import 'package:ecommerce/presentation/screens/auth/login_screens.dart';
import 'package:ecommerce/presentation/screens/auth/provider/signup_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui.dart';
import '../../widgets/gap_widget.dart';
import '../../widgets/link_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routeName = "signup";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(
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
              Text("Create Account", style: TextStyles.heading2),
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
              const GapWidget(),
              PrimaryTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Confirm your password!";
                  }

                  if (value.trim() != provider.passwordController.text.trim()) {
                    return "Passwords do not match!";
                  }

                  return null;
                },
                controller: provider.cPasswordController,
                labelText: "password",
                obscureText: true,
              ),
              const GapWidget(),
              PrimaryButton(
                text: (provider.isLoading) ? "..." : "Create Account",
                onPressed: provider.createAccount,
              ),
              const GapWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have already account?", style: TextStyles.body2),
                  const GapWidget(),
                  LinkButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    text: "SignIn",
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
