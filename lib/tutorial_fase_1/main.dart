import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/tutorial_fase_1/account.dart';
import 'package:flutter_tutorial/models.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> listEmployee = [];
  List<ScreenSizeItem1> listScreenSizeItem1 = [],
      listScreenSizeItem2 = [],
      listScreenSizeItem3 = [],
      listScreenSizeItem4 = [];
  bool loading = false, isEmpty = true, setSize = false;
  int widthFirstItem = 0;
  int heightFirstItem = 0;

  Future<List<Employee>> getEmployee(String url) async {
    http.Response response = await http.get(url);
    final int statusCode = response.statusCode;
    final String jsonBody = response.body;

    print(statusCode);

    if (statusCode < 200 || statusCode > 400 || jsonBody == null) {
      throw new Exception("Error while fetching data");
    }

    print("asdasd");

    print(jsonBody);

    final List container = json.decode(jsonBody);

    container.removeRange(6, container.length - 1);

    return container.map((dataRaw) => new Employee.fromJson(dataRaw)).toList();
  }

  _refreshData(List<Employee> listData) {
    setState(() {
      listEmployee = listData;
      loading = false;
      isEmpty = false;
    });
  }

  _onError() {
    setState(() {
      loading = false;
      isEmpty = true;
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Error Bos")));
    });
  }

  @override
  void initState() {
    loading = true;
    getEmployee("http://dummy.restapiexample.com/api/v1/employees")
        .then((data) => _refreshData(data))
        .catchError((Exception) {
      _onError();
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String s1 = "satu";
    String s2 = "apa ${s1.toLowerCase()}1";

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Builder(builder: (BuildContext context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  widthFirstItem = context.size.width.toInt();
                  heightFirstItem = context.size.height.toInt();
                  if (!isEmpty) {
                    if (!setSize) {
                      setState(() {
                        setSize = true;
                      });
                    }
                  }
                });
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Color(0xFF000000),
                  child: Center(
                      child: Text(
                    "Widht: $widthFirstItem, Height: $heightFirstItem",
                    style: TextStyle(color: Colors.white),
                  )),
                );
              }),
              _firstItem(),
              _secondItem(
                  "Sewa Lepas Kunci", "Pilih destinasi terbaik untuk dikunjungi", listEmployee),
              _thirdItem("Sewa degan Supir", "Pilih Mobil sesua kebutuhanmu!", listEmployee),
              _fourthItem("Cerita Perjalanan", listEmployee),
              _fifthItem()
            ],
          ),
        )));
  }

  _firstItem() {
    List<String> x = ["Lepas Kunci", "Dengan Supir", "Mobil Spesial"];
    return Container(
        margin: EdgeInsets.all(10),
        child:_firstItemChild(x));
//
  }

  Widget _firstItemChild(List<String> x) {
    List<Widget> listChild = [];
    for (int i = 0; x.length > i; i++) {
      listScreenSizeItem1.add(new ScreenSizeItem1(width: 0, height: 0));
      listChild.add(Expanded( 
        flex: 1,
        child: Builder(builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            listScreenSizeItem1[i].height = context.size.height.toInt();
            listScreenSizeItem1[i].width = context.size.width.toInt();
          });
          return Center(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(padding: EdgeInsets.all(5), child: _firstItemChildIcon()),
                O(child: Text("Test => ${x[i]}")),
                Text("Width : ${listScreenSizeItem1[i].width ?? 0}"),
                Text("Height: ${listScreenSizeItem1[i].height ?? 0}")
              ],
            ),
          ));
        }),
      ));
    }
    return Row(children: listChild);
  }

  _firstItemChildIcon() {
    return Container(width: 70, height: 70, color: Colors.orange);
  }

  _titleItem(String title, String desc) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _titleItemSecond(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  _secondItem(String title, String desc, List<Employee> listData) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleItem(title, desc),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : isEmpty || listData.length == 0
                        ? Center(
                            child: Text("Data Kosong"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[_firstList(listEmployee)],
                            )))
          ],
        ));
  }

  _thirdItem(String title, String desc, List<Employee> listData) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleItem(title, desc),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : isEmpty || listData.length == 0
                        ? Center(
                            child: Text("Data Kosong"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                _secondList(listData),
                              ],
                            )))
          ],
        ));
  }

  _fourthItem(String title, listData) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleItemSecond(title),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : isEmpty || listData.length == 0
                        ? Center(
                            child: Text("Data Kosong"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[_thirdList(listData)],
                            )))
          ],
        ));
  }

  _fifthItem() {
    return Builder(builder: (BuildContext context) {
      return Container(
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 150,
                    color: Colors.orangeAccent,
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Tampil Keren Dengan Mobil Eksotis",
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            )),
                        FlatButton(
                          padding: EdgeInsets.all(10),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) => AccountPage())),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.black,
                          child: Text(
                            "Sewa Sekarang Juga",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                            top: -60,
                            child: Container(
                              width: 200,
                              height: 80,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ));
    });
  }

  Widget _firstList(List<Employee> listEmployee) {
    List<Widget> listWidget = [];

    for (int i = 0; i < listEmployee.length; i++) {
      listScreenSizeItem2.add(ScreenSizeItem1(width: 0, height: 0));
      listWidget.add(Builder(builder: (BuildContext context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          listScreenSizeItem2[i].height = context.size.height.toInt();
          listScreenSizeItem2[i].width = context.size.width.toInt();
        });
        return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Column(
              children: <Widget>[
                Container(padding: EdgeInsets.all(10), width: 80, height: 80, color: Colors.blue),
                Container(
                    width: 80,
                    child: Text(
                      listEmployee[i].name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    )),
                Container(
                    width: 80,
                    child: Text(
                      "Width : ${listScreenSizeItem2[i].width}",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    )),
                Container(
                    width: 80,
                    child: Text(
                      "Height : ${listScreenSizeItem2[i].height}",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ))
              ],
            ));
      }));
    }

    return Row(children: listWidget);
  }

  Widget _secondList(List<Employee> employee) {
    List<Widget> listItem = [];
    for (int i = 0; employee.length > i; i++) {
      listScreenSizeItem3.add(ScreenSizeItem1(width: 0, height: 0));
      listItem.add(Builder(builder: (BuildContext context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          listScreenSizeItem3[i].width = context.size.width.toInt();
          listScreenSizeItem3[i].height = context.size.height.toInt();
        });
        return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10), width: 300, height: 150, color: Colors.blue),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.black,
                        child: Text(
                          "Gambar ini hanya ilustrasi",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.orange,
                          child: Text(
                            "Sewa",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        )),
                    Container(
                        width: 300,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: 100,
                                child: Text(
                                  employee[i].name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            Text(
                              "Dengan Supir",
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              "Rp ${employee[i].salary}/ 6 jam",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            Text(
                              "Width: ${listScreenSizeItem3[i].width}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            Text(
                              "Height: ${listScreenSizeItem3[i].height}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ));
      }));
    }

    return Container(
        child: Row(
      children: listItem,
    ));
  }

  _thirdList(List<Employee> listData) {
    List<Widget> listItem = [];
    for (int i = 0; listData.length > i; i++) {
      listScreenSizeItem4.add(ScreenSizeItem1(width: 0, height: 0));
      listItem.add(Builder(builder: (BuildContext context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          listScreenSizeItem4[i].width = context.size.width.toInt();
          listScreenSizeItem4[i].height = context.size.height.toInt();
        });
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
          child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.all(10), width: 300, height: 150, color: Colors.blue),
                  ),
                  Container(
                      width: 300,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            listData[i].name,
                            maxLines: 1,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("${listData[i].age} - ${listData[i].salary}",
                                            style: TextStyle(fontSize: 12, color: Colors.black))
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Baca",
                                      style: TextStyle(fontSize: 15, color: Colors.orange),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text("Width : ${listScreenSizeItem4[i].width}"),
                          Text("height: ${listScreenSizeItem4[i].height}")
                        ],
                      )),
                ],
              )),
        );
      }));
    }

    return Row(children: listItem);
  }
}

class O extends StatefulWidget {
  final Widget child;

  O({this.child});

  @override
  _OState createState() => _OState();
}

class _OState extends State<O> {
  Size size;

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          size = Size(context.size.width , context.size.height);
        });
      });
    }

    List<Widget> w = [widget.child];

    if (size != null) {
      w.add(Text("width: ${size.width}\nheight: ${size.height}"));
    }

    return Container(child: Column(children: w),);
  }
}

