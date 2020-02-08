import 'package:flutter/material.dart';


class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Container(height:300,width:300,child: Image.asset("assets/error.gif"))),
            Center(child: Text("Not a match",style: TextStyle(fontSize: 20,fontFamily: "Nixie One"),)),

          ],
        ));
  }
}
