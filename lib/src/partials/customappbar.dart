import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar(
    {String title = "",
    bool hideSearch = false,
    bool showBack = false,
    GlobalKey<ScaffoldState>? scaffoldKey,
    BuildContext? pageContext}) {
  void searchAction() {
    if (pageContext != null) {
      Navigator.pushReplacementNamed(pageContext, '/search');
    }
  }

  IconButton drawerIcon = IconButton(
      onPressed: () {
        scaffoldKey?.currentState?.openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ));

  IconButton backIcon = IconButton(
      onPressed: () {
        if (pageContext != null) {
          Navigator.pop(pageContext);
        }
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ));

  IconButton leadingButton = drawerIcon;

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvertica Neue'),
    ),
    leading: leadingButton,
    actions: <Widget>[
      !hideSearch
          ? IconButton(
              onPressed: searchAction,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
          : Container()
    ],
  );
}
