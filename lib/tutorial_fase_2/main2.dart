import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_tutorial/models.dart';

void main() => runApp(Fase2App());

class Fase2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Tutorial 2",
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

Page _getJson() {

  var jsonData = Fase2.x;
  var home = jsonData[0];
  var people = jsonData[1];
  var story = jsonData[2];
  Page pageHome = Page.fromJson(home);
  Page pagePeople = Page.fromJson(people);
  Page pageStory = Page.fromJson(story);

  print("JsonHome: ${pageHome.toString()}");

  print("JsonPeople: ${pagePeople.toString()}");

  print("JsonStory: $pageStory");

  return pageHome;
}


class HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    Page dataHome = _getJson();
    List<Content> listContent = dataHome.content;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(dataHome.appbarTitle),
          centerTitle: true,
        ),
        body: Container(

          child: Column(
            children: <Widget>[

            ],
          ),
        ));
  }


  Widget _listContentComponent(List<Content> data){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(

      ),
    );
  }




}
