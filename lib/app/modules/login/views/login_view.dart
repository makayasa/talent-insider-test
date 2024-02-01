import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_button.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../components/login_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: kDefaultScaffoldPadding,
        child: FormBuilder(
          key: controller.formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 140),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              const SizedBox(height: 70),
              DefText(
                'Welcome Back!',
                color: kBgWhite,
              ).huge,
              DefText(
                'Login to your account',
                color: kBgWhite,
              ).semilarge,
              const SizedBox(height: 35),
              const LoginField(
                label: 'E-mail',
                isEmail: true,
                fieldName: 'email',
                hint: 'Enter Work E-mail',
              ),
              const SizedBox(height: 15),
              const LoginField(
                label: 'Password',
                isPassword: true,
                fieldName: 'password',
                hint: 'Enter Password',
              ),
              const SizedBox(height: 35),
              DefaultButton(
                width: double.infinity,
                child: Center(
                  child: DefText('Log In', color: kBgWhite).semilarge,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                    child: Divider(),
                  ),
                  const SizedBox(width: 10),
                  DefText('Or', color: kBgWhite).large,
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              DefaultButton(
                color: Colors.black,
                showBorder: true,
                child: Center(
                  child: DefText(
                    'Explore without login',
                    color: kBgWhite,
                    fontWeight: FontWeight.bold,
                  ).semilarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
