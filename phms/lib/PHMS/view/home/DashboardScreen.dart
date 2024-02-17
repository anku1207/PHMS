import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/utility.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // This navigator state will be used to navigate different pages
  late String title;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState!
            .pushNamedAndRemoveUntil(UavRoutes.Home_Screen, (route) => false);

        break;
      case 1:
        _navigatorKey.currentState!.pushNamedAndRemoveUntil(
            UavRoutes.Product_Screen, (route) => false);
        break;
      case 2:
        _navigatorKey.currentState!
            .pushNamedAndRemoveUntil(UavRoutes.Home_Screen, (route) => false);

        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_navigatorKey.currentState?.canPop() ?? false) {
            _navigatorKey.currentState!.pop();
            return false;
          } else {
            return onWillPop();
          }
        },
        child: Scaffold(
          body: Navigator(
              key: _navigatorKey, onGenerateRoute: RouteGenerator.homeRoute),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Constants.UavPrimaryColor,
            // Set the background color here
            selectedItemColor: Constants.Select_Icon_Color,
            // Set color for selected item
            unselectedItemColor: Constants.AppBar_Icon_Color,
            // Set color for unselected items

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
            onTap: _onTap,
            currentIndex: _currentTabIndex,
          ),
        ));
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press back button again to exit',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
