import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/constants.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget(
      {Key? key,
      required this.userName,
      required this.email,
      required this.loginType,
      required this.previousContext})
      : super(key: key);
  var userName;
  var email;
  BuildContext previousContext;
  String loginType;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<bool> _isExpandedList = [];

  late String loginType;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List<bool>.generate(2, (index) => false);
    loginType = widget.loginType;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Set padding to zero
        children: <Widget>[
          _buildDrawerHeader(context),
          loginType != "1"
              ? Column(
                  children: [
                    _buildPortfolioItem(
                      context: context,
                      leftIcon: Image.asset(
                        'assets/images/addmember.png',
                        width: 30,
                        height: 30,
                        color: Colors.black,
                      ),
                      rightIcon: Icon(Icons.arrow_right),
                      btnName: 'Family',
                      subtitle: 'Add members/View Member',
                    ),
                    _buildDivider(),
                    _buildPortfolioItem(
                      context: context,
                      leftIcon: Image.asset(
                        'assets/images/medical_bill.png',
                        width: 30,
                        height: 30,
                        color: Colors.black,
                      ),
                      rightIcon: Icon(Icons.arrow_right),
                      btnName: 'Bills',
                      subtitle: 'Search by date and member',
                    ),
                    _buildDivider(),
                    _buildPortfolioItem(
                      context: context,
                      leftIcon: Image.asset(
                        'assets/images/report.png',
                        width: 30,
                        height: 30,
                        color: Colors.black,
                      ),
                      rightIcon: Icon(Icons.arrow_right),
                      btnName: 'Report',
                      subtitle: 'Search by date and member',
                    ),
                    _buildDivider(),
                    _parentChildList(),
                  ],
                )
              : SizedBox(), // Empty widget if loginType is not "1"
          _buildPortfolioItem(
            context: context,
            leftIcon: Image.asset(
              'assets/images/profile.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            rightIcon: Icon(Icons.arrow_right),
            btnName: 'Profile',
          ),
          _buildDivider(),
          _buildPortfolioItem(
            context: context,
            leftIcon: Image.asset(
              'assets/images/about.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            rightIcon: Icon(Icons.arrow_right),
            btnName: 'AboutsUs',
          ),
          _buildDivider(),
          _buildPortfolioItem(
            context: context,
            leftIcon: Image.asset(
              'assets/images/t&c.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            rightIcon: Icon(Icons.arrow_right),
            btnName: 'Terms & Condition',
          ),
          _buildDivider(),
          _buildPortfolioItem(
            context: context,
            leftIcon: Image.asset(
              'assets/images/signout.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            rightIcon: Icon(Icons.arrow_right),
            btnName: 'SignOut',
          ),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        widget.userName,
      ),
      accountEmail: Text(
        widget.email,
      ),
      currentAccountPicture: GestureDetector(
        onTap: () => showDialog(
          builder: (context) => AlertDialog(
            title: Text('Himdeve Fashion'),
            content: Text(
                'To be a designer is a kind of art work. However, to proceed further, to develop a brand and to find a marketplace for the ideas, it is sometimes a struggle. But with a firm determination, love and passion, finally, at the end, a little wish may come true… And that wish is called the Himdeve. The brand designed to be successful.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          context: context,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(
              'https://himdeve.eu/wp-content/uploads/2019/04/logo_retina.png'),
        ),
      ),
      decoration: BoxDecoration(color: UavPrimaryColor),
    );
  }

  Widget _parentChildList() {
    final List<Map<String, dynamic>> data = [
      {
        'parent': 'Services',
        'children': [
          {
            "title": "Ambulance",
            "subtitle": "Ambulance list with details and booking",
            "icon": "assets/images/ambulance.png"
          },
          {
            "title": "Medicals",
            "subtitle": "Nearby Medicals list with details",
            "icon": "assets/images/madical.png"
          },
          {
            "title": "Labs",
            "subtitle": "Nearby labs list with details",
            "icon":"assets/images/labs.png"
          },
          {
            "title": "Checkup",
            "subtitle": "Health checkup packages details",
            "icon":"assets/images/checkup.png"
          },
          {
            "title": "Other",
            "subtitle": "Other Third party services can be added here",
            "icon":"assets/images/other.png"
          }
        ]
      },
    ];

    return Column(
      children: data.map<Widget>((item) {
        final parent = item['parent'] as String;
        final children = item['children'] as List<Map<String, dynamic>>;
        final int index = data.indexOf(item);

        return Column(
          children: [
            ListTile(
              title: Text(
                parent,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: _isExpandedList[index]
                  ? Icon(Icons.keyboard_arrow_up)
                  : Icon(Icons.keyboard_arrow_down),
              onTap: () {
                setState(() {
                  _isExpandedList[index] = !_isExpandedList[index];
                });
              },
            ),
            if (_isExpandedList[index])
              Column(
                children: children
                    .map((child) => Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          // Adjust the left margin as needed
                          child: _buildPortfolioItem(
                            context: context,
                            leftIcon: Image.asset(
                              child['icon'],
                              width: 30,
                              height: 30,
                              color: Colors.black,
                            ),
                            rightIcon: Icon(Icons.arrow_right),
                            btnName: child['title'] as String,
                            subtitle: child['subtitle'] as String,
                          ),
                        ))
                    .toList(),
              ),
            _buildDivider(),
          ],
        );
      }).toList(),
    );
  }

  ListTile _buildPortfolioItem({
    required BuildContext context,
    required Image leftIcon,
    required Icon rightIcon,
    required String btnName,
    String? subtitle,
  }) {
    return ListTile(
      title: Text(
        '$btnName',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      leading: leftIcon,
      trailing: rightIcon,
      onTap: () {
        Navigator.of(context).pop();
        if (btnName == 'ADD_APPOINTMENT') {
          // Navigator.pushNamed(widget.previousContext, UavRoutes.AddAppointment_Screen);
        } else if (btnName == 'LOGOUT') {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Text(
                          "Are you sure you want to logout ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(widget.previousContext);
                            },
                            child: Text("No".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {},
                            child: Text("Yes".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              });
        }
      },
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.black,
    );
  }
}
