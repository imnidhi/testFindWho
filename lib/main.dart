import 'package:find_who/upload.dart';
import 'package:flutter/material.dart';
import 'Success.dart';
import 'Error.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  initialRoute: '/error',
      routes: {
        '/upload': (context) => Upload(),
        '/success': (context) => Success(),
        '/error': (context) => Error(),
        '/home': (context) => MyApp(),
      },
      title: 'Find Who',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Find Who'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/police.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/upload');
                  },
                  child: Container(
                      height: 60,
                      color: Colors.blue,
                      child: Center(
                          child: Text("REGISTER A CRIMINAL",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, '/upload');
                  },
                  child: Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        "CHECK IF CRIMINAL",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}
