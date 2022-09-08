import 'package:blog_app/services/routes/app_pages.dart';
import 'package:blog_app/services/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'core/theme/theme.dart';
import 'di/injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  DependencyInjector.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ApplicationTheme.getAppThemeData(),
        initialRoute: AppRoutes.splash,
        getPages: AppPages.list,
        darkTheme: ApplicationTheme.getAppThemeData(),
        themeMode: ThemeMode.system,
      );
    });
  }
}
