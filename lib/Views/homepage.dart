import 'package:appfood/Helpers/footer.dart';
import 'package:appfood/Helpers/headers.dart';
import 'package:appfood/Helpers/middle.dart';
import 'package:appfood/Services/managemaps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(context),
              Divider(),
              MiddleHelpers().textFav(),
              MiddleHelpers().dataFav(context, 'favourites'),
              MiddleHelpers().textBusiness(),
              MiddleHelpers().dataBusiness(context, 'business'),
            ],
          ),
        ),
      ),
    );
  }
}
