import 'package:appfood/Services/managedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0;
  int beaconValue = 0;
  int onionValue = 0;
  int cartData = 0;
  String get getSize => size;
  String size;
  bool isSelected = false;
  bool smallTapped = false;
  bool mediumTapped = false;
  bool largeTapped = false;
  bool selected = false;

  int get getCheesValue => cheeseValue;
  int get getBeaconValue => cheeseValue;
  int get getOnionValue => cheeseValue;
  int get getCartValue => cheeseValue;
  bool get getSelected => selected;

  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  addOnion() {
    onionValue++;
    notifyListeners();
  }

  minusOnion() {
    onionValue--;
    notifyListeners();
  }

  minusBeacon() {
    beaconValue--;
    notifyListeners();
  }

  minusCheese() {
    cheeseValue--;
    notifyListeners();
  }

  selectSmallSize() {
    smallTapped = true;
    size = 'S';
    notifyListeners();
  }

  selectedMediumSize() {
    mediumTapped = true;
    size = 'M';
    notifyListeners();
  }

  selectedLargeSize() {
    largeTapped = true;
    size = 'L';
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    beaconValue = 0;
    onionValue = 0;
    mediumTapped = false;
    smallTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black,
              height: 50.0,
              child: Center(
                child: Text(
                  'select size!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    }
  }
}
