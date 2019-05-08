import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models.dart';

void main() => runApp(Fase3App());

class Fase3App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tutorial 3",
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: HomePage3()
    );
  }
}

class HomePage3 extends StatefulWidget {

  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {

  StringController stringController;
  IntController intController;
  ListController listController;
  MapController mapController;
  ClassController classController;
  List<String> listString;
  Map<String, String> map ;

  int counter =  0;


  _changeString(String text){
    ++counter;
    stringController.value = "$text $counter";
  }

  _changeInt(){
    ++counter;

    intController.value = counter;
  }

  _changeListString(){
    ++counter;
    listController.value = List.from(listController.value)..add("Padimas $counter");
  }

  _changeMap(){
     ++counter;

     map["Name"] = "Reno $counter";

     print("${map["Name"]}");

     mapController.value = Map.from(map);
  }

  _changeObject(){
    ++counter;
    var age = classController.value.age + 1;
    var salary = classController.value.salary + 200;
    classController.value = Tutorial3(name: "Reno $counter", age: age, salary: salary);
  }

  @override
  void initState() {
    listString = ["Padimas", "padimas 2"];
    map = {"Name": "Reno"};
    stringController = StringController("Before Boss");
    intController = IntController(0);
    listController = ListController(listString);
    mapController = MapController(map);
    classController = ClassController(Tutorial3(name: "Reno", age: 28, salary: 2000.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Training 3")),
      body: Center(child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(child: StringObject(controller: stringController)),
            InkWell(
              onTap: () {
                _changeString("Keren Bos");
              },
              child: _buttonUI("Print String"),
            ),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: IntObject(intController: intController)),
            InkWell(
              onTap: () {
                _changeInt();
              },
              child: _buttonUI("Print Integer"),
            ),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: ListObject(listController: listController)),
            InkWell(
              onTap: () {
                _changeListString();
              },
              child: _buttonUI("Print List String"),
            ),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: MapObject(mapController: mapController)),
            InkWell(
              onTap: () {
                _changeMap();
              },
              child: _buttonUI("Print Map"),
            ),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: ClassObject(classController: classController)),
            InkWell(
              onTap: () {
                _changeObject();
              },
              child: _buttonUI("Print Class"),
            ),
          ],
        ),
      ),)

    );
  }
}

Widget _buttonUI(String text){
  return Container(
    padding: EdgeInsets.all(8.0),
    color: Colors.black,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.0
      )
    )
  );
}

class StringController extends ValueNotifier<String> {
  StringController(String value) : super(value);
}

class IntController extends ValueNotifier<int>{
  IntController(int value) : super(value);

}

class ListController extends ValueNotifier<List<String>>{
  ListController(List<String> value) : super(value);

}

class MapController extends ValueNotifier<Map<String, String>>{
  MapController(Map<String, String> value) : super(value);

}

class ClassController extends ValueNotifier<Tutorial3>{
  ClassController(Tutorial3 value) : super(value);
}


class ClassObject extends StatefulWidget {
  final ClassController classController;

  ClassObject({this.classController});

  @override
  _ClassObjectState createState() => _ClassObjectState();
}

class _ClassObjectState extends State<ClassObject> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Name: ${widget.classController.value.name}"),
        Text("Age: ${widget.classController.value.age}"),
        Text("Salary: ${widget.classController.value.salary}"),
      ],
    );
  }

  @override
  void initState() {
      widget.classController.addListener((){
        setState(() {

        });
      });
  }
}






class MapObject extends StatefulWidget{
  final MapController mapController;

  MapObject({this.mapController});

  @override
  _MapObjectState createState() => _MapObjectState();
}

class _MapObjectState extends State<MapObject> {


  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.mapController.value["Name"]));
  }

  @override
  void initState() {
    widget.mapController.addListener((){
      setState(() {

      });
    });
  }
}


class ListObject extends StatefulWidget {
  final ListController listController;

   ListObject({this.listController});


  @override
  _ListObjectState createState() => _ListObjectState();
}





class _ListObjectState extends State<ListObject> {

  @override
  void initState() {
    widget.listController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  _displayList(widget.listController.value);
  }
}

 Widget _displayList(List<String> x){
  List<Widget> listWidget = [];
  for(int i = 0; x.length>i ;i++){
    listWidget.add(Text(x[i]));
  }

  return Column(children: listWidget);
 }




class IntObject extends StatefulWidget {
  final IntController intController;

  IntObject({this.intController});


  @override
  _IntObjectState createState() => _IntObjectState();
}

class _IntObjectState extends State<IntObject> {


  @override
  void initState() {
    widget.intController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Bos ${widget.intController.value}"));
  }
}






class StringObject extends StatefulWidget {
  final StringController controller;

  StringObject({this.controller});

  @override
  _StringObjectState createState() => _StringObjectState();
}

class _StringObjectState extends State<StringObject> {

  @override
  Widget build(BuildContext context) {

    return Container(child: Text("${widget.controller.value}"));
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {

      });
    });
  }
}


