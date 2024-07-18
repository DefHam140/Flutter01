import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/control/control.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PersistentTabScreen extends StatefulWidget {
  const PersistentTabScreen({super.key});

  @override
  State<PersistentTabScreen> createState() => _PersistentTabScreenState();
}

class _PersistentTabScreenState extends State<PersistentTabScreen> {
  late PersistentTabController _controller;
  
  /*
  PersistentTabView(
  controller: _controller,
  ...
  );

  _controller.jumpToTab(2);

  // Navigate to the previously selected Table
  _controller.jumpToPreviousTab();
  */

  @override
  void initState() {
    // TODO: implement initState

    _controller  = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        screenTransitionAnimation: ScreenTransitionAnimation.none(),
        
        tabs: [
          PersistentTabConfig(
            screen: const Home(),
            item: ItemConfig(
              icon: FaIcon(FontAwesomeIcons.house),
              //title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: const Profile(),
            item: ItemConfig(
              icon: FaIcon(FontAwesomeIcons.person),
              //title: "Profile",
            ),
          ),
          PersistentTabConfig(
            screen: Control(),
            item: ItemConfig(
              icon: FaIcon(FontAwesomeIcons.airbnb),
              //title: "Profile",
            ),
          ),
          PersistentTabConfig(
            screen: const Home(),
            item: ItemConfig(
              icon: Badge(
              child: const Icon(
                  Icons.chat_rounded,
              ),
              )
              //title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: const Profile(),
            item: ItemConfig(
              icon: FaIcon(FontAwesomeIcons.gear),
              activeForegroundColor: Colors.purple,
              inactiveForegroundColor: Colors.yellow,
              //title: "Profile",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,

        ),
      ),
    );
  }
}