import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyectemos_prof/commons/styles.dart';

import '../../commons/strings.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();
  bool loadingGoogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.grayLight2,
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '¡Bienvenidos a Proyectemos!',
                      style: ThemeText.h2title35yellow,
                    ),
                    Text(
                      Strings.descriptionLogin,
                      style: ThemeText.paragraph14Gray,
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ThemeColors.yellow),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _controller.login().then(
                                (_) => Navigator.pushNamed(context, '/'),
                              );
                          setState(() {
                            loadingGoogle = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: loadingGoogle
                              ? [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ]
                              : [
                                  const FaIcon(
                                    FontAwesomeIcons.google,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      Strings.iniciaSessao,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      ),
                                    ),
                                  )
                                ],
                        ),
                      ),
                    ),
                    Text(
                      Strings.capesDescription,
                      style: ThemeText.paragraph12gray,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    'images/login_img.png',
                    height: 700,
                    width: 700,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
