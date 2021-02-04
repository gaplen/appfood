//import 'dart:html';

import 'package:appfood/Miniviews/maps.dart';
import 'package:appfood/Providers/authentication.dart';
import 'package:appfood/Providers/calculations.dart';
import 'package:appfood/Services/managedata.dart';
import 'package:appfood/Services/managemaps.dart';
import 'package:appfood/Views/splashscreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class MyCart extends StatefulWidget {
  MyCart({Key key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            headerText(),
            cartData(context, 'myOrder'),
            shippinDetails(context),
            billingData(),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.rightToLeftWithFade));
              }),
          Padding(
            padding: const EdgeInsets.only(left: 280.0),
            child: IconButton(
                icon: Icon(FontAwesomeIcons.trash, color: Colors.red),
                onPressed: () async {
                  Provider.of<ManageData>(context, listen: false)
                      .deleteData(context);
                  Provider.of<Calculations>(context, listen: false).cartData =
                      0;
                }),
          ),
        ],
      ),
    );
  }

  Widget headerText() {
    return Column(
      children: [
        Text(
          'Mi',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        Text(
          'carrito',
          style: TextStyle(
              color: Colors.grey, fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget cartData(BuildContext context, collection) {
    return SizedBox(
        height: 300.0,
        child: FutureBuilder(
            future: Provider.of<ManageData>(context, listen: false)
                .fetchData(collection),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('animation/17100-food.json'),
                );
              } else {
                return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onLongPress: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ]),
                        height: 200.0,
                        width: 400.0,
                        child: Row(
                          children: [
                            SizedBox(
                                child: Image.network(
                                    snapshot.data[index].data()['image'])),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data[index].data()['name'],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Text(
                                  'price: ${snapshot.data[index].data()['price'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18.0),
                                ),
                                Text(
                                  'price: ${snapshot.data[index].data()['price'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18.0),
                                ),
                                Text(
                                  'Onion: ${snapshot.data[index].data()['onion'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18.0),
                                ),
                                Text(
                                  'Beacon: ${snapshot.data[index].data()['beacon'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18.0),
                                ),
                                Text(
                                  'cheese: ${snapshot.data[index].data()['cheese'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18.0),
                                ),
                                CircleAvatar(
                                  child: Text(
                                    snapshot.data[index].data()['size'],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }

  Widget shippinDetails(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          blurRadius: 5,
          spreadRadius: 3,
        ),
      ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      height: 130.0,
      width: 400.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            constraints: BoxConstraints(maxWidth: 250.0),
                            child: Text(
                                Provider.of<GenerateMaps>(context, listen: true)
                                    .getFinalAdress)),
                      ),
                    )
                  ],
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Maps(),
                              type: PageTransitionType.bottomToTop));
                    })
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(EvaIcons.clock),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: Text('6pm - 8pm')),
                  )
                ],
              ),
              IconButton(icon: Icon(Icons.edit), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'subtotal',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      '300.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'delivery charges',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      '20.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'total',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.black,
                        size: 16.0,
                      ),
                      Text(
                        '320.00',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Authentication>(context, listen: false).getUid == null
                ? print('we are gatting ui: $userUid')
                : print(
                    Provider.of<Authentication>(context, listen: false).getUid);
          },
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                'place order',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
