import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPage createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  bool heart = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  void backButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    var cityData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;

    var starRate = double.parse(cityData['review']).floor();
    var stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      heart = appdata.hasFavorites(cityData['name']);

      return Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250,
                child: Image.network(cityData['places'][0]['img'],
                    fit: BoxFit.cover),
              ),
              ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 220),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        cityData['name'],
                                        style: TextStyle(
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: stars[0]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[1]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[2]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[3]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[4]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 16,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            cityData['review'],
                                            style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    heart
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      heart =
                                          appdata.favorite(cityData['name']);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 0, left: 15, right: 15, bottom: 10),
                            child: Text(
                              cityData['description'],
                              style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "PRINCIPAIS PONTOS TURISTICOS",
                              style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          GridView.count(
                              padding: EdgeInsets.only(bottom: footerHeight),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 10 / 11,
                              children: List.generate(cityData['places'].length,
                                  (index) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            cityData['places'][index]['img'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                              cityData['places'][index]['name'],
                                              style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))),
                                      Container(
                                        child: Text('Ponto Turístico',
                                            style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: Colors.black)),
                                      )
                                    ],
                                  ),
                                );
                              }))
                        ],
                      ))
                ],
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: statusBarHeight),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    backButtonAction(context);
                  },
                ),
              )
            ],
          ));
    });
  }
}
