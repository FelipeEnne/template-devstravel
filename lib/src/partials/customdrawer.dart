import 'package:flutter/material.dart';

Widget CustomDrawer({BuildContext? pageContext}) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('DevTravel',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica Newe')),
          Text('1.0.0',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica Newe')),
        ]),
        decoration: BoxDecoration(color: Colors.blue),
      ),
      ListTile(
          leading: Icon(Icons.home, color: Colors.black),
          title: Text("Home"),
          onTap: () {
            if (pageContext != null) {
              Navigator.pushReplacementNamed(pageContext, '/home');
            }
          }),
      ListTile(
          leading: Icon(Icons.public, color: Colors.black),
          title: Text("Escolher Continente"),
          onTap: () {
            if (pageContext != null) {
              Navigator.pushReplacementNamed(pageContext, '/continent');
            }
          }),
      ListTile(
          leading: Icon(Icons.search, color: Colors.black),
          title: Text("Buscar Cidade"),
          onTap: () {
            if (pageContext != null) {
              Navigator.pushReplacementNamed(pageContext, '/search');
            }
          }),
      ListTile(
          leading: Icon(Icons.favorite, color: Colors.black),
          title: Text("Cidades Salvas"),
          onTap: () {
            if (pageContext != null) {
              Navigator.pushReplacementNamed(pageContext, '/favorites');
            }
          }),
    ],
  ));
}
