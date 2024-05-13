import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectemos_prof/commons/styles.dart';

import '../registration/registration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = SideMenuController();
  int _currentIndex = 0;
  bool _turmasSelected = false;
  final _signIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SideMenu(
              controller: _controller,
              backgroundColor: Colors.white,
              mode: SideMenuMode.open,
              builder: (data) {
                return SideMenuData(
                  items: [
                    SideMenuItemDataTitle(
                        title: 'Proyectemos',
                        textAlign: TextAlign.start,
                        titleStyle: ThemeText.h3title20yellow,
                        padding: const EdgeInsetsDirectional.only(
                          top: 20,
                          bottom: 30,
                          start: 8,
                          end: 8,
                        )),
                    SideMenuItemDataTile(
                      margin: const EdgeInsetsDirectional.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      isSelected:
                          _currentIndex == 0 && _turmasSelected == false,
                      onTap: () => setState(
                          () => {_currentIndex = 0, _turmasSelected = false}),
                      title: 'Dashboard',
                      selectedTitleStyle: const TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white),
                      titleStyle: const TextStyle(color: ThemeColors.gray),
                      icon: const Icon(Icons.dashboard_outlined),
                      selectedIcon: const Icon(Icons.dashboard),
                      highlightSelectedColor: ThemeColors.yellow,
                    ),
                    SideMenuItemDataTile(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        isSelected: _currentIndex == 1,
                        title: 'Turmas',
                        onTap: () => setState(
                            () => {_currentIndex = 1, _turmasSelected = true}),
                        selectedTitleStyle: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                        titleStyle: const TextStyle(color: ThemeColors.gray),
                        icon: const Icon(Icons.people_alt_outlined),
                        selectedIcon: const Icon(Icons.people_alt),
                        highlightSelectedColor: ThemeColors.yellow),
                    SideMenuItemDataTile(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        isSelected: _currentIndex == 2,
                        onTap: () => setState(
                            () => {_currentIndex = 2, _turmasSelected = false}),
                        title: 'Email',
                        selectedTitleStyle: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                        icon: const Icon(Icons.email_outlined),
                        selectedIcon: const Icon(Icons.email),
                        titleStyle: const TextStyle(color: ThemeColors.gray),
                        highlightSelectedColor: ThemeColors.yellow),
                    SideMenuItemDataTile(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        isSelected: _currentIndex == 3,
                        onTap: () => setState(
                            () => {_currentIndex = 3, _turmasSelected = false}),
                        title: 'Notificações',
                        selectedTitleStyle: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                        titleStyle: const TextStyle(color: ThemeColors.gray),
                        icon: const Icon(Icons.notifications_active_outlined),
                        selectedIcon: const Icon(Icons.notifications_active),
                        highlightSelectedColor: ThemeColors.yellow),
                    SideMenuItemDataTitle(
                        title: 'Conta',
                        textAlign: TextAlign.start,
                        titleStyle: ThemeText.h3title20yellow,
                        padding: const EdgeInsetsDirectional.only(
                          top: 20,
                          bottom: 30,
                          start: 8,
                          end: 8,
                        )),
                    SideMenuItemDataTile(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        isSelected: _currentIndex == 4,
                        onTap: () => setState(
                            () => {_currentIndex = 4, _turmasSelected = false}),
                        title: 'Configurações',
                        selectedTitleStyle: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                        titleStyle: const TextStyle(color: ThemeColors.gray),
                        icon: const Icon(Icons.settings_outlined),
                        selectedIcon: const Icon(Icons.settings),
                        highlightSelectedColor: ThemeColors.yellow),
                    SideMenuItemDataTile(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        isSelected: _currentIndex == 5,
                        onTap: () => setState(() => {
                              _currentIndex = 5,
                              _turmasSelected = false,
                              _signIn.signOut(),
                          _signIn.disconnect(),
                              Navigator.pushNamed(context, '/login')
                            }),
                        title: 'Logout',
                        selectedTitleStyle: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                        titleStyle: const TextStyle(color: ThemeColors.gray),
                        icon: const Icon(Icons.logout_outlined),
                        selectedIcon: const Icon(Icons.logout),
                        highlightSelectedColor: ThemeColors.yellow),
                  ],
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _turmasSelected
                        ? const RegistrationPage()
                        : const SizedBox()
                    // Text(
                    //   'body',
                    //   style: Theme.of(context).textTheme.displaySmall,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _controller.toggle();
                    //   },
                    //   child: const Text('change side menu state'),
                    // )
                  ],
                ),
              ),
            ),
            // SideMenu(
            //   position: SideMenuPosition.right,
            //   builder: (data) => const SideMenuData(
            //     customChild: Text('custom view'),
            //   ),
            // ),
          ],
        ),
      ),

      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   child: Row(
      //     children: <Widget>[
      //       InkWell(
      //         onHover: (value) => ,
      //         child: Drawer(
      //           child: ListView(
      //             padding: EdgeInsets.zero,
      //             children: <Widget>[
      //               DrawerHeader(
      //                 decoration: BoxDecoration(
      //                   color: ThemeColors.white,
      //                 ),
      //                 child: Text('Drawer Header'),
      //               ),
      //               ListTile(
      //                 leading: Icon(Icons.location_city),
      //                 title: Text('Partner'),
      //                 onTap: () {},
      //               ),
      //               ListTile(
      //                 leading: Icon(Icons.multiline_chart),
      //                 title: Text('Proyek'),
      //                 onTap: () {},
      //               ),
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
