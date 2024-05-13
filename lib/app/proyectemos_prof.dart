import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proyectemos_prof/app/registration/registration_page.dart';

import '../commons/styles.dart';
import '../providers/google_sign_in_provider.dart';
import '../services/auth_check.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';

class ProyectemosProf extends StatelessWidget {
  const ProyectemosProf({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Proyectemos Prof',
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primaryColor: ThemeColors.yellow,
                secondaryHeaderColor: ThemeColors.blue,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const AuthCheck(),
                '/home': (context) => const HomePage(),
                '/login': (context) => const LoginPage(),
                '/registration': (context) => const RegistrationPage(),
              },
            );
          },
        ),
      );
}
