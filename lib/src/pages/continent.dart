import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  scaffoldKey: _scaffoldKey,
                  pageContext: context,
                  title: 'Escolha um continent',
                  hideSearch: false),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: ListView.builder(
                  itemCount: appdata.data.length,
                  itemBuilder: (context, index) {
                    return Text('Continente: ${appdata.data[index]['name']}');
                  }),
            ));
  }
}
