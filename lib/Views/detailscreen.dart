import 'package:appfood/Providers/calculations.dart';
import 'package:appfood/Views/homepage.dart';
import 'package:appfood/Views/mycart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  DetailedScreen({this.queryDocumentSnapshot});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int cheeseValue = 0;
  int beaconValue = 0;
  int onionValue = 0;
  int totalItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(context),
          newImage(),
          middleData(),
          footerDetails(),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
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
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.red,
                ),
                onPressed: () {
                  Provider.of<Calculations>(context, listen: false)
                      .removeAllData();
                }),
          ),
        ],
      ),
    );
  }

  Widget newImage() {
    return Center(
      child: SizedBox(
        height: 280.0,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade700,
              size: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.queryDocumentSnapshot['ratings'],
                style: TextStyle(fontSize: 20.0, color: Colors.grey.shade500),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300.0),
              child: Text(
                widget.queryDocumentSnapshot['name'],
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.rupeeSign,
                  size: 20.0,
                  color: Colors.cyan,
                ),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 300.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 4,
                        spreadRadius: 3)
                  ]),
              width: 400.0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'add more stuff',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('cheese',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 22.0)),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusCheese();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getCheesValue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                              icon: Icon(EvaIcons.plus),
                              onPressed: () {
                                Provider.of<Calculations>(context,
                                        listen: false)
                                    .addCheese();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Onion',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {}),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getOnionValue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                              icon: Icon(EvaIcons.plus),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'beacon',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(EvaIcons.minus),
                              onPressed: () {},
                            ),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getBeaconValue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                              icon: Icon(EvaIcons.plus),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectSmallSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectedMediumSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectedLargeSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Provider.of<Calculations>(context, listen: false)
                              .largeTapped
                          ? Colors.red
                          : Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Calculations>(context, listen: false)
                .addToCart(context, {
              'image': widget.queryDocumentSnapshot['image'],
              'name': widget.queryDocumentSnapshot['name'],
              'price': widget.queryDocumentSnapshot['price'],
              'onion': Provider.of<Calculations>(context, listen: false)
                  .getOnionValue,
              'beacon': Provider.of<Calculations>(context, listen: false)
                  .getBeaconValue,
              'cheese': Provider.of<Calculations>(context, listen: false)
                  .getCheesValue,
              'size': Provider.of<Calculations>(context, listen: false).getSize
            });
          },
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: MyCart(), type: PageTransitionType.bottomToTop));
              },
              child: Icon(
                Icons.shopping_basket,
                color: Colors.black,
              ),
            ),
            Positioned(
                left: 35,
                child: CircleAvatar(
                  radius: 10,
                  child: Text('$totalItems'),
                ))
          ],
        )
      ],
    );
  }
}
