import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

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
  List list = [
    {
      'Item Name': 'itemname1',
      'Quantity': '1000 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    {
      'Item Name': 'itemname2',
      'Quantity': '12300 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    {
      'Item Name': 'itemname3',
      'Quantity': '1000 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    {
      'Item Name': 'itemname4',
      'Quantity': '1000 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    {
      'Item Name': 'itemname4',
      'Quantity': '1000 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    {
      'Item Name': 'itemname555555555555555',
      'Quantity': '1000 KG',
      'Price': '123',
      'Last updated': '2 days',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vertical-garden-1519931492.jpg',
    },
    
  ];

  Widget dis(List list, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80.0,
                width: 80.0,
                //color: Colors.red
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "${list[index]['image']}"),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Item Name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: Text(
                          "${list[index]['Item Name']}",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${list[index]['Quantity']}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Price: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${list[index]['Price']}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Last Updated ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${list[index]['Last updated']}",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () {
          print("List tile");
        },
      ),
    );
  }

  Widget display(List empl) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Container(
         // color: Colors.blue,
          height: (MediaQuery.of(context).size.height * 0.17) * list.length,
          child: disableScrollGlow(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: empl.length,
              itemBuilder: (context, index) => Card(child: dis(empl, index),elevation: 3.0,),
            ),
          ),
        ));
  }

  Widget disableScrollGlow({Widget child}) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: child,
    );
  }
void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
}
  Future<void> fetchemp() async {}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Herbical"),
              Text(
                "PLANTS/SUPPLIERS",
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
          backgroundColor: Colors.green[800],
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
                child: FittedBox(
              child: Container(
                child: Text("TRADE"),
              ),
            )),
            Tab(
              child: Column(
                children: [
                  Text("MY"),
                  FittedBox(child: Container(child: Text("POSTS")))
                ],
              ),
            ),
            Tab(
              icon: Icon(Icons.group),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ]),
        ),
        body: TabBarView(children: [
          Center(child: Text("Tab 1")),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.30,
                        //color: Colors.blue,
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                "https://www.xtrafondos.com/wallpapers/vertical/the-batman-con-fondo-rojo-6426.jpg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.30,
                        //color: Colors.blue,
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                "https://i.pinimg.com/originals/c7/44/9c/c7449c31e186f79c90695a088d38366e.jpg"),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: fetchemp(),
                      builder: (context, snapshot) => display(list)),
                ],
              ),
            ),
          ),
          Center(child: Text("Tab 3")),
          Center(child: Text("Tab 4")),
          Center(child: Text("Tab 5")), 
        ]),
      ),
    );
  }
}
