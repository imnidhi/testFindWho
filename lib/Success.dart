import 'package:flutter/material.dart';
class Success extends StatefulWidget {

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  double discountPrice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Container(height:300,width:300,child: Image.asset("assets/success.gif"))),
            Center(child: Text("Found a Match",
            style: TextStyle(fontSize: 40,fontFamily: "Nixie One"))),
          ],
        ));
  }
}