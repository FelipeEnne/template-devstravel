import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar(
    {String title = "", bool hideSearch = false, bool showBack = false}) {
  IconButton drawerIcon = IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ));

  IconButton backIcon = IconButton(
      onPressed: () {},
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
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
          : Container()
    ],
  );
}
