import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      'Appbar personalizado',
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvertica Neue'),
    ),
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        )),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ))
    ],
  );
}
