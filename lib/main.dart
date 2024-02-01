import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:skeleton/config/initial_bindings.dart';

import 'app/routes/app_pages.dart';
import 'config/color_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
      initialBinding: InitialBindings(),
      // defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        FormBuilderLocalizationsDelegate(),
      ],
    ),
  );
}
