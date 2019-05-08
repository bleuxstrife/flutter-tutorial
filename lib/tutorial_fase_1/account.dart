import 'package:flutter/material.dart';
import 'package:flutter_tutorial/tutorial_fase_1/icons.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      padding: EdgeInsets.all(10),
                      height: 100,
                      color: Colors.yellow,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 30,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 20,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text("Reno Rizky Ollantino"),
                                            padding:
                                                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          ),
                                          Container(
                                            child: Text("Profil Saya"),
                                            padding:
                                                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 1"))),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 2"))),
                    Container(
                      width: double.infinity,
                      height: 1,
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      color: Colors.black,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 3"))),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 4"))),
                    Container(
                      width: double.infinity,
                      height: 1,
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      color: Colors.black,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 5"))),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: InkWell(child: _buttonFunction(ImageIcons.imageSample, "Menu 6"))),
                  ],
                ))));
  }

  _buttonFunction(IconData image, String title) {
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: Icon(image)),
        Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(title),
            )),
        Expanded(flex: 1, child: Icon(ImageIcons.rightArrow))
      ],
    );
  }
}
