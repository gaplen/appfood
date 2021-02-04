import 'package:appfood/Services/managemaps.dart';
import 'package:appfood/Views/login.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
//import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Headers extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(EvaIcons.logOutOutline),
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('uid');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: Login(), type: PageTransitionType.leftToRight));
              }),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.locationArrow,
                color: Colors.grey.shade600,
                size: 12.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0),
                child: Text(
                  finalAddress,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.search, color: Colors.black),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget headerText() {
    return Container(
      constraints: BoxConstraints(maxWidth: 300.0),
      child: RichText(
        text: TextSpan(
            text: 'what would you like',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 29.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'to eat?',
                  style: TextStyle(
                      fontSize: 46.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))
            ]),
      ),
    );
  }

  Widget headerMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 15.0),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey.shade100),
              height: 40.0,
              width: 100.0,
              child: Center(
                child: Text(
                  'all food',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 15.0),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey.shade100),
              height: 40.0,
              width: 100.0,
              child: Center(
                child: Text(
                  'pizza',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 15.0),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey.shade100),
              height: 40.0,
              width: 100.0,
              child: Center(
                child: Text(
                  'drinks',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
