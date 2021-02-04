import 'package:appfood/Providers/authentication.dart';
import 'package:appfood/Views/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('myOrder')
        .doc(Provider.of<Authentication>(context, listen: false).getUid)
        .set(data);
  }

  Future deleteData(BuildContext context) {
    return FirebaseFirestore.instance
        .collection('myOrder')
        .doc(Provider.of<Authentication>(context, listen: false).getUid == null
            ? userUid
            : Provider.of<Authentication>(context, listen: false).getUid)
        .delete();
  }
}
