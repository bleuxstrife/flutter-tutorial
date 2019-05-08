import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models.dart';
import 'package:flutter_tutorial/tutorial_fase_4/api_service.dart';
import 'package:pit_components/components/adv_column.dart';
import 'package:pit_components/components/adv_future_builder.dart';
import 'package:pit_components/components/adv_row.dart';
import 'package:pit_components/components/adv_text.dart';

void main() => runApp(TutorialApp());

class TutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tutorial App", theme: ThemeData(primarySwatch: Colors.green), home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Team> listTeam = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Premier League")),
        body: AdvFutureBuilder(futureExecutor: _loadAll, widgetBuilder: _widgetBuilder));
  }

  Widget _widgetBuilder(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: AdvColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AdvColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: AdvText(
                    "Premier League Team",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
                  )),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AdvColumn(
              children: <Widget>[_teamItem()],
            ),
          )
        ],
      ),
    );
  }

  Widget _teamItem() {
    List<Widget> listWidget = [];

    for (int i = 0; i < listTeam.length; i++) {
      listWidget.add(AdvColumn(
        margin: EdgeInsets.all(8.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.blue,
            width: 120.0,
            height: 120.0,
            child: CachedNetworkImage(
              imageUrl: listTeam[i].teamBadge,
              placeholder: (context, url) =>  CircularProgressIndicator(),
              errorWidget: (context, url, error)=> Icon(Icons.error),
            ),
          ),
          Container(

              child: AdvText(
                "${listTeam[i].teamName}",
                maxLines: 1,
                textAlign: TextAlign.center,
              )),
        ],
      ));
    }

    return Row(children: listWidget);
  }

  Future<bool> _loadAll(BuildContext context) async {

    listTeam = await APIService.getListTeam();
    return true;
  }
}
