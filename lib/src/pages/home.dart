import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class HomePage extends StatelessWidget {
  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'Home',
            hideSearch: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Bem vindo ao',
                    style: styles,
                  ),
                ),
                Image.asset('lib/assets/flutter1_devstravel_logo.png',
                    width: 200),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Seu guia de viagem perfeito',
                    style: styles,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
